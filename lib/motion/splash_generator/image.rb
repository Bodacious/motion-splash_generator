module Motion
  module SplashGenerator
    class Image
  
      include Magick
  
      attr_reader :size
  
  
      def initialize(size)
        @size = size
      end

      def report
        if File.exist?(filename)
          puts("Created #{filename.ljust(50)}\t(#{size.actual_width}x#{size.actual_height} for #{size.idiom})")
        end
      end
  
      def write!
        create_target_directory
        if requested_splash_for_size_idiom?(size)
          begin
            scaled_image.write(filename)
          rescue
            warn("Couldn't write #{filename}")
          end
        else
          puts "Skipping #{size.idiom}"
        end
      end
  
  
      private

  
      def scaled_image
        template_image.resize_to_fill(size.actual_width, size.actual_height)
      end
  
      def filename
        "#{target}/#{size.name}"
      end
  
      def requested_splash_for_size_idiom?(size)
        device == 'universal' || size.idiom.start_with?(device)
      end
  
      def template_image
        if File.exist?(img_name)
          ImageList.new(img_name)
        else
          raise LoadError, "Can't find resources/splash-template.png. Did you even RTFM?"
        end
      end
  
      def create_target_directory
        FileUtils.mkdir(target) unless Dir.exist?(target)
      end
  
      def img_name
        ENV['TEMPLATE'] || "resources/splash-template.png"
      end
  
      def device
        ENV['DEVICES'] || 'iphone'
      end
  
      def target
        ENV['TARGET'] || 'splashes'
      end

    end

  end
end
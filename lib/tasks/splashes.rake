# encoding : utf-8
require 'lib/motion/splash_generator/size'
require 'lib/motion/splash_generator/image'

namespace :splashes do

  desc "Creates splash images for all devices"
  
  task :generate do
    splash_image_sizes.each do |size| 
      Motion::SplashGenerator::Image.new(size).tap do |splash_image|
        splash_image.write!
        splash_image.report        
      end
    end
  end


  private


  def splash_image_sizes
    @splash_image_sizes ||= default_splash_image_sizes + local_splash_image_sizes
  end
  
  def default_splash_image_sizes
    filename = File.join(Motion::SplashGenerator.root, 
      "lib/motion/splash_generator/splashes.yaml").to_s
    splash_image_sizes_from_file(filename)
  end

  def local_splash_image_sizes
    splash_image_sizes_from_file("config/splashes.yaml")
  end
  
  def splash_image_sizes_from_file(filename)
    begin
      YAML.load(File.read(filename)).map do |attributes|
        Motion::SplashGenerator::Size.new(attributes)
      end.flatten
    rescue Errno::ENOENT
      []
    end 
  end

end
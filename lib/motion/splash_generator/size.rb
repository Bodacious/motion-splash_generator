module Motion
  
  module SplashGenerator
    
    class Size
  
      attr_reader :name
      attr_reader :orientation
      attr_reader :width
      attr_reader :height
      attr_reader :idiom
      attr_accessor :scale
      attr_reader :orientation
  
      def initialize(attributes)
        for key, value in attributes
          instance_variable_set("@#{key}", value)
        end
      end
  
      def actual_width
        scale * width
      end
  
      def actual_height
        scale * height
      end
  
    end
    
  end
  
end
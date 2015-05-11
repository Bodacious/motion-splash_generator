

require "motion/splash_generator/version"


module Motion
  module SplashGenerator
    def self.root
      @root ||= File.join(File.dirname(__FILE__), '..', '..')
    end
  end
end

$LOAD_PATH.unshift(Motion::SplashGenerator.root)

load "lib/tasks/splashes.rake"

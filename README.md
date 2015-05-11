# Splash Generator

Are you tired of spending hours creating all of the different splash image versions you need for your app?

**Splash Generator** effortlessly generates all of the iOS splash images you'll ever need.

Need icons? We gots them here: https://github.com/KatanaCode/motion-icon_generator

## Installation

You'll need to install imagemagick first:

``` bash
brew install imagemagick
```

Then add this line to your application's Gemfile:

```ruby
gem 'motion-splash_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-splash_generator

and add it to your `Rakefile`:

    require 'motion/splash_generator'

## Usage

Usage is super-easy:

1. Create a template splash image and save it as resources/splash-template.png. This should be about 2048x2048 pixels.
2. run this rake task to create your splashes `rake splashes:generate`. After a few glorious seconds you should see a new directory filled with images called simply "splashes/"


## Configuration

You can also set the following environment variables to change the default behaviour:

### Template image name/path

    rake splashes:generate TEMPLATE="~/Desktop/my_template.png"

### Target directory name

    rake splashes:generate TARGET="resources" # we do this, but it's well bad!

### Device types supported

    rake splashes:generate DEVICES="iphone"
    rake splashes:generate DEVICES="ipad"
    rake splashes:generate DEVICES="universal" # creates all splash sizes

### Adding extra splash sizes types.

Icons are defined in [splashes.yaml](lib/motion/splash_generator/splashes.yaml). If you'd like to add your own custom splash sizes on a per-app basis, create a file named `config/splashes.yaml` in your app and stick some YAML in there.

If you see an image type that we're missing, please create a pull request or an issue.  

## Contributing

1. Fork it ( https://github.com/KatanaCode/motion-splash_generator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Acknowledgements

This was based partly on [https://github.com/spren9er/s9splashgen](https://github.com/spren9er/s9splashgen) by [@spren9er](https://github.com/spren9er) 

By [Katana Code: web developers, mobile app developers, nice guys](katanacode.com/tools?utm_source=GitHub&utm_medium=README&utm_campaign=motion-splash_generator
)
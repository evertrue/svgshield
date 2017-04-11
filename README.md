# Svgshield

A very simple library for generating your own SVG status shields. For example:

![hello world](https://img.shields.io/badge/hello-world-blue.svg "hello world")

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'svgshield'
```

And then execute:

    $ bundle

## Usage

To generate an image object:

```ruby
redimage1 = Svgshield.new('Subject', 'Status', 'red') # color words
redimage2 = Svgshield.new('Subject', 'Status', '#f00') # hexadecimal colors
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/evertrue/svgshield.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


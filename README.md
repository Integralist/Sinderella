# Cinderella

Ruby gem which will allow authors to pass a code block to transform a data object for a specific period of time.

Note that this repo exists for demonstration purposes only now, as after I had started the project I discovered there was already a [Cinderella gem](http://rubygems.org/gems/cinderella) and although the project owner has officially abandoned it I'm not able to take over the gem name...

> nope, pick a new name. If anyone cares about it in 3 years I'll hand it over.

So until stated otherwise please ignore the following installation steps as you'll end up with a different project installed.

## Installation

Add this line to your application's Gemfile:

    gem 'Cinderella'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Cinderella

## Usage

```ruby
data = { :key => 'value' }
till_midnight = 60 * 60 # 1hr

Cinderella.transforms(data, till_midnight) do |data|
  data.each do |key, value|
    data.tap { |d| d[key].upcase! } # convert data to uppercase
  end
end
```

## Contributing

1. Fork it ( http://github.com/Integralist/Cinderella/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

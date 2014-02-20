# Sinderella

[![Build Status](https://travis-ci.org/Integralist/Cinderella.png?branch=master)](https://travis-ci.org/Integralist/Cinderella)

Ruby gem which will allow authors to pass a code block to transform a data object for a specific period of time.

Note I created this repo and all the code under the name "Cinderella" but it later transpired that the name was already taken and although the project owner has officially abandoned it I'm not able to take over the gem name...

> nope, pick a new name. If anyone cares about it in 3 years I'll hand it over.

So I decided to rename the project and publish the gem under the title of Sinderella instead.

## Installation

Add this line to your application's Gemfile:

    gem 'sinderella'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinderella

## Usage

```ruby
data = { :key => 'value' }
till_midnight = 60 * 60 # 1hr

id = Sinderella.transforms(data, till_midnight) do |data|
  data.each do |key, value|
    data.tap { |d| d[key].upcase! } # convert data to uppercase
  end
end # returns a hash of the data to use as an id/key

Sinderella.midnight(id) # reset the data ahead of schedule
```

## Contributing

1. Fork it ( http://github.com/Integralist/Sinderella/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

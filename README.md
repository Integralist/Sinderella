# Sinderella

[![Build Status](https://travis-ci.org/Integralist/Sinderella.png?branch=master)](https://travis-ci.org/Integralist/Sinderella) [![Gem Version](https://badge.fury.io/rb/sinderella.png)](http://badge.fury.io/rb/sinderella)

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
require 'sinderella'

data = { :key => 'value' }
till_midnight = 60 # 1 minute

id = Sinderella.transforms(data, till_midnight) do |data|
  data.each do |key, value|
    data.tap { |d| d[key].upcase! }
  end
end

puts Sinderella.get(id)

# we'll randomly reset the data before the time expires...
puts "Resetting data early" and Sinderella.midnight(id) if (rand() * 2).to_i == 1

sleep 10

# if reset early     == { :key => 'value' }
# if not reset early == { :key => 'VALUE' }
puts Sinderella.get(id)

sleep 60

# time has expired by this point so == { :key => 'value' }
puts Sinderella.get(id)
```

## Contributing

1. Fork it ( http://github.com/Integralist/Sinderella/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

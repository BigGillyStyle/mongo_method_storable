# MongoMethodStorable

MongoMethodStorage allows you to store the output of methods in a Mongoid::Document class into MongoDB dynamic fields.  It also lazily stores the output, in that the value is only stored the first time the method is called on a given object.  Subsequent calls to the method will just read the attribute value from the document, eliminating the "cost" of executing the method.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongo_method_storable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongo_method_storable

## Usage

`include MongoMethodStorable`

```ruby
def some_method
  # complex/expensive algorithm
end
mongo_store :some_method
```

## Limitations

1. Methods can take no arguments (currently)
2. There is no option (currently) to force the method to be evaluated after the first time.
3. No tests have been written on this code (caveat: it *is* being used in at least one production application)
4. This is my first "real" published Ruby gem
5. A bunch of other limitations I'm sure I'll think of over time

## Contributing

1. Fork it ( https://github.com/BigGillyStyle/mongo_method_storable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# ISBNTool

Tool for validating and hyphenating ISBN13 strings.

## Installation

Add this line to your application's Gemfile:

    gem 'isbn_tool'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isbn_tool

## Usage

    require 'isbn_tool'
    validator = ISBN13Validator.new("9783639514971") 
    validator.valid? => true
    validator.hyphenate? => "978-3-639-51497-1"
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

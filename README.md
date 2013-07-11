# ISBNTool

Tool for validating, hyphenating and generating ISBN13 strings. 

## Installation

Add this line to your application's Gemfile:

    gem 'isbn_tool'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isbn_tool

## Validation and Hyphenation

    require 'isbn_tool'
    isbn = IsbnTool::Isbn.new("9783639514971") 
    isbn.valid?
    # => true
    isbn.hyphenate
    # => "978-3-639-51497-1"

## Generating random ISBNs with a given prefix
The generator ensures only the correctness of checksum and length.

    require 'isbn_tool'
    
    # calling with empty string prefix means that it generates 12 length random string + calculates checksum
    generator = IsbnTool::IsbnGenerator.new("") 
    generator.generate(5)
    # => ["1947770387308", "2396519020829", "4998014357110", "4166430628408", "9474375291409"]
    # These ISBNs are probably not valid!
    isbn = IsbnTool::Isbn.new("1947770387308")
    isbn.valid?
    # => IsbnTool::IsbnParserException: Not valid prefix element!: 194

    # to generate valid ISBNs you need to provide valid prefix, registration group and registrant element
    # if we have the following ISBN: 978-3-8473-9068-8, we can take the first 3 prefixes 978-3-8473 and generate random ISBNs from those prefixes
    generator = IsbnTool::IsbnGenerator.new("97838473")
    generator.generate(5)
    # => ["9783847358817", "9783847399346", "9783847369998", "9783847398608", "9783847332374"]
    IsbnTool::Isbn.new("9783847358817").valid?
    # => true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

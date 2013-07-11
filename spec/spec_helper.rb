require 'rspec'
require File.expand_path('../../lib/isbn_tool.rb', __FILE__)

ENV['ISBN_METADATA_XML'] = File.expand_path('../vendor/isbn_range.xml', __FILE__)

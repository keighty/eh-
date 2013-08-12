require 'spec_helper'

describe "Parser" do
  CLASS_TEST = <<-EOS
as Movie:
  can initialize(name):
    pass

  can x:
    2

if true:
  aw = Movie.new("brilliant!")
else:
  weird
EOS

  # it 'should parse a class definition' do
  #   # p Lexer.new.tokenize(CLASS_TEST)
  #   p Parser.new.parse(CLASS_TEST)
  # end
end
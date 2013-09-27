require 'spec_helper'
require 'fixtures'

describe "Lexer" do

  before { @lex = Lexer.new }

  it 'tokenizes a test string' do
    @lex.tokenize('"testing"').should eq [[:STRING, "testing"]]
  end

  it 'tokenizes a test constant' do
    @lex.tokenize("True").should eq [[:CONSTANT, "True"]]
  end

  it 'tokenizes a say command' do
    @lex.tokenize("say 'hello'").should eq [[:IDENTIFIER, "print"], [:STRING, "hello"]]
  end

  it 'tokenizes a class definition' do
    @lex.tokenize("a Car\n").should eq [[:A, 'a'], [:CONSTANT, 'Car']]
    @lex.tokenize("an Automobile\n").should eq [[:AN, 'an'], [:CONSTANT, 'Automobile']]
  end

  it 'tokenizes a hockey declaration' do
    @lex.tokenize("hockey").should eq [[:HOCKEY, 'hockey']]
  end

  it 'tokenizes an : operator' do
    @lex.tokenize(":\n").should eq [["{", "{"]]
  end

  it 'tokenizes an eh? operator' do
    @lex.tokenize("eh?\n").should eq [["}", "}"]]
  end

  it "should parse a number expression" do
    @lex.tokenize(NUMBER_EXPRESSION).should include [:NUMBER, 5]
  end

  it 'parses an if operation' do
    @lex.tokenize(IF_EXPRESSION).should include [:IF, "if"]
  end

  it "parses a while expression" do
    @lex.tokenize(WHILE_EXPRESSION).should include [:WHILE, "while"]
  end

  it "should parse a method definition" do
    tokens = [[:CAN, "can"], [:IDENTIFIER, "curl"]]
    tokens.each do |token|
      @lex.tokenize(FULL_CLASS).should include token
    end
    expect(@lex.tokenize(FULL_CLASS)).not_to include [:IDENTIFIER, "eh"]
  end
end
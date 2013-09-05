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

  it 'tokenizes a class definition' do
    @lex.tokenize("a Car").should eq [[:A, 'a'], [:CONSTANT, 'Car']]
    @lex.tokenize("an Automobile").should eq [[:AN, 'an'], [:CONSTANT, 'Automobile']]
  end

  it 'tokenizes a hockey declaration' do
    @lex.tokenize("hockey").should eq [[:HOCKEY, 'hockey']]
  end

  it 'tokenizes a single operator' do
    @lex.tokenize("+").should eq [["+", "+"]]
  end

  it 'tokenizes a double operator' do
    @lex.tokenize("==").should eq [["=", "="], ["=", "="]]
  end

  it 'tokenizes an : operator' do
    @lex.tokenize(":\n").should eq [["{", "{"]]
  end

  it 'tokenizes an eh? operator' do
    @lex.tokenize("eh?\n").should eq [["}", "}"]]
  end

  it 'parses simple operation' do
    @lex.tokenize(SIMPLE).should eq [[:IDENTIFIER, 'x'], ['<', '<'], [:IDENTIFIER, 'y']]
  end

  it "should parse a number expression" do
    @lex.tokenize(NUMBER_EXPRESSION).should include [:NUMBER, 5]
  end

  it 'parses an if operation' do
    @lex.tokenize(IF_EXPRESSION).should eq [[:IF, "if"], [:IDENTIFIER, "x"], ["<", "<"], [:IDENTIFIER, "y"], ["{", "{"], [:IDENTIFIER, "print"], [:STRING, "special"], [:NEWLINE, "\n"], ["}", "}"]]
  end

  it "parses a while expression" do
    @lex.tokenize(WHILE_EXPRESSION).should eq [[:WHILE, "while"], [:IDENTIFIER, "x"], ["<", "<"], [:IDENTIFIER, "y"], ["{", "{"], [:IDENTIFIER, "print"], [:IDENTIFIER, "x"], [:NEWLINE, "\n"], [:IDENTIFIER, "x"], ["+", "+"], ["+", "+"], [:NEWLINE, "\n"], ["}", "}"], [:IDENTIFIER, "print"], [:STRING, "Done!!"]]
  end

  it "should parse a full class definition" do
    expect(@lex.tokenize(FULL_CLASS)).to eq [[:A, "a"], [:CONSTANT, "Canadian"], ["{", "{"], [:CAN, "can"], [:IDENTIFIER, "curl"], ["{", "{"], [:IF, "if"], [:IDENTIFIER, "skip"], ["{", "{"], [:IDENTIFIER, "say"], [:STRING, "Hurry!"], [:NEWLINE, "\n"], ["}", "}"], ["}", "}"], [:NEWLINE, "\n"],[:CAN, "can"], [:IDENTIFIER, "say_aboot"], ["{", "{"], [:IDENTIFIER, "say"], [:STRING, "What's it all aboot?"], [:NEWLINE, "\n"], ["}", "}"], ["}", "}"]]
  end

  it "should parse a method definition" do
    tokens = [[:CAN, "can"], [:IDENTIFIER, "curl"]]
    tokens.each do |token|
      @lex.tokenize(FULL_CLASS).should include token
    end
    expect(@lex.tokenize(FULL_CLASS)).not_to include [:IDENTIFIER, "eh"]
  end

  it "should parse a basic class" do
    expect(@lex.tokenize(BASIC_CLASS)).not_to include [:IDENTIFIER, "eh"]
  end
end
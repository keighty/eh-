require 'spec_helper'
require 'fixtures'

describe "Lexer" do

  before { @lex = Lexer.new }

  it 'tokenizes a test string' do
    @lex.tokenize("testing").should eq [[:IDENTIFIER, "testing"]]
  end

  it 'tokenizes a test constant' do
    @lex.tokenize("True").should eq [[:CONSTANT, "True"]]
  end

  it 'tokenizes a class definition' do
    @lex.tokenize("a Car").should eq [[:A, 'a'], [:CONSTANT, 'Car']]
  end

  it 'tokenizes a test single operator' do
    @lex.tokenize("+").should eq [["+", "+"]]
  end

  it 'tokenizes a test single operator' do
    @lex.tokenize(" < ").should eq [["<", "<"]]
  end

  it 'tokenizes a test double operator' do
    @lex.tokenize("==").should eq [["=", "="], ["=", "="]]
  end

  it 'tokenizes an eh? operator' do
    @lex.tokenize("eh?").should eq [["}", "}"]]
  end

  it 'parses simple operation' do
    @lex.tokenize(SIMPLE).should eq [[:IDENTIFIER, 'x'], ['<', '<'], [:IDENTIFIER, 'y']]
  end

  it "should parse a number expression" do
    @lex.tokenize(NUMBER_EXPRESSION).should include [:NUMBER, 5]
  end

  it 'parses an if operation' do
    @lex.tokenize(IF_EXPRESSION).should eq [[:IF, "if"], [:IDENTIFIER, "x"], ["<", "<"], [:IDENTIFIER, "y"], ["{", "{"], [:NEWLINE, "\n"], [:IDENTIFIER, "print"], [:STRING, "special"], [:NEWLINE, "\n"], ["}", "}"]]
  end

  it "parses a while expression" do
    @lex.tokenize(WHILE_EXPRESSION).should eq [[:WHILE, "while"], [:IDENTIFIER, "x"], ["<", "<"], [:IDENTIFIER, "y"], ["{", "{"], [:NEWLINE, "\n"], [:IDENTIFIER, "print"], [:IDENTIFIER, "x"], [:NEWLINE, "\n"], [:IDENTIFIER, "x"], ["+", "+"], ["+", "+"], [:NEWLINE, "\n"], ["}", "}"], [:NEWLINE, "\n"], [:IDENTIFIER, "print"], [:STRING, "Done!!"]]
  end

  it "should parse a full class definition" do
    expect(@lex.tokenize(FULL_CLASS)).to eq [[:A, "a"], [:CONSTANT, "Canadian"], ["{", "{"], [:NEWLINE, "\n"], [:CAN, "can"], [:IDENTIFIER, "curl"], ["{", "{"], [:NEWLINE, "\n"], [:IF, "if"], [:IDENTIFIER, "skip"], ["{", "{"], [:NEWLINE, "\n"], [:IDENTIFIER, "say"], [:STRING, "Hurry!"], [:NEWLINE, "\n"], ["}", "}"], [:NEWLINE, "\n"], ["}", "}"], [:NEWLINE, "\n"], [:NEWLINE, "\n"], [:CAN, "can"], [:IDENTIFIER, "say_aboot"], ["{", "{"], [:NEWLINE, "\n"], [:IDENTIFIER, "say"], [:STRING, "What's it all aboot?"], [:NEWLINE, "\n"], ["}", "}"], [:NEWLINE, "\n"], ["}", "}"]]
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
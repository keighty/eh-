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

  it 'parses simple operation' do
    @lex.tokenize(SIMPLE).should eq [[:IDENTIFIER, 'x'], ['<', '<'], [:IDENTIFIER, 'y']]
  end

  it 'parses if operations' do
    @lex.tokenize(IF_EXPRESSION).should eq [[:IF, 'if'], [:IDENTIFIER, 'x'], ['<', '<'], [:IDENTIFIER, 'y'], [:INDENT, 2], [:IDENTIFIER, 'print'], [:STRING, 'special'], [:DEDENT, 0], [:NEWLINE, "\n"]]
  end

  it "should parse a while expression code" do
    tokens = [[:WHILE, "while"], [:IDENTIFIER, "x"], [:INDENT, 2], [:NEWLINE, "\n"]]
    tokens.each do |token|
      @lex.tokenize(WHILE_EXPRESSION).should include token
    end
  end

  it "should parse an if expression" do
    tokens = [[:IF, "if"], [:INDENT, 2], [:IDENTIFIER, "print"]]
    tokens.each do |token|
      @lex.tokenize(IF_EXPRESSION).should include token
    end
  end

  it "should parse a number expression" do
    @lex.tokenize(NUMBER_EXPRESSION).should include [:NUMBER, 5]
  end

  it "should parse a full class definition" do
    tokens = [[:A, "a"], [:CONSTANT, "Canadian"]]
    tokens.each do |token|
      @lex.tokenize(FULL_CLASS).should include token
    end
  end

  it "should parse a method definition" do
    tokens = [[:CAN, "can"], [:IDENTIFIER, "curl"]]
    tokens.each do |token|
      @lex.tokenize(FULL_CLASS).should include token
    end
  end

  it "should parse a basic class" do
    p @lex.tokenize(BASIC_CLASS)
  end

  it "should check for bad indent level" do
    expect { @lex.tokenize(BAD_DEDENT) }.to raise_error
  end

  it "should check for missing :" do
    expect { @lex.tokenize(BAD_INDENT) }.to raise_error
  end
end
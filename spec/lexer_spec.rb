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

  # it "should parse simple code" do
  #   tokens = [[:WHILE, "while"], [:IDENTIFIER, "x"], [:INDENT, 2], [:NEWLINE, "\n"]]
  #   tokens.each do |token|
  #     @lex.tokenize(CODE1).should include token
  #   end
  # end

  # it "should parse a function" do
  #   tokens = [[:IF, "if"], [:NUMBER, 1], [:INDENT, 4], [:IDENTIFIER, "print"]]
  #   tokens.each do |token|
  #     @lex.tokenize(CODE2).should include token
  #   end
  # end

  # it "should parse a class definition" do
  #   tokens = [[:AS, "as"], [:CONSTANT, "Car"]]
  #   tokens.each do |token|
  #     @lex.tokenize(CODE2).should include token
  #   end
  # end

  # it "should parse a method definition" do
  #   tokens = [[:CAN, "can"], [:IDENTIFIER, "drive_fast"]]
  #   tokens.each do |token|
  #     @lex.tokenize(CODE2).should include token
  #   end
  # end
end
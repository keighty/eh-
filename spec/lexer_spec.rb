require 'spec_helper'

describe "Lexer" do

CODE1 = <<-EOS
while x < y:
  print x
  x++
print "Done!!"
EOS
CODE2 = <<-EOS
as a Car:
  can drive_fast:
    if 1:
      print "..."
    if false:
      pass
    print "fast!"
EOS

  subject { @lex }
  before { @lex = Lexer.new }
  it { should respond_to(:tokenize) }

  it 'tokenizes a test string' do
    @lex.tokenize("testing").should eq [[:IDENTIFIER, "testing"]]
  end

  it 'tokenizes a test constant' do
    @lex.tokenize("True").should eq [[:CONSTANT, "True"]]
  end

  it 'tokenizes a test single operator' do
    @lex.tokenize("+").should eq [["+", "+"]]
  end

  it 'tokenizes a test double operator' do
    @lex.tokenize("==").should eq [["=", "="], ["=", "="]]
  end

  it "should parse simple code" do
    tokens = [[:WHILE, "while"], [:IDENTIFIER, "x"], [:INDENT, 2], [:NEWLINE, "\n"]]
    tokens.each do |token|
      @lex.tokenize(CODE1).should include token
    end
  end

  it "should parse a function" do
    tokens = [[:IF, "if"], [:NUMBER, 1], [:INDENT, 4], [:IDENTIFIER, "print"]]
    tokens.each do |token|
      @lex.tokenize(CODE2).should include token
    end
  end

  it "should parse a class definition" do
    tokens = [[:AS, "as"], [:CONSTANT, "Car"]]
    tokens.each do |token|
      @lex.tokenize(CODE2).should include token
    end
  end

  it "should parse a method definition" do
    tokens = [[:CAN, "can"], [:IDENTIFIER, "drive_fast"]]
    tokens.each do |token|
      @lex.tokenize(CODE2).should include token
    end
  end
end
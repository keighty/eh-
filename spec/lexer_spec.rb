require 'spec_helper'
require 'fixtures'

describe "Lexer" do

  before { @lex = Lexer.new }

  it 'should tokenize keywords' do
    @lex.tokenize("hockey").should eq [[:HOCKEY, 'hockey']]
    @lex.tokenize("if").should eq [[:IF, "if"]]
    @lex.tokenize("while").should eq [[:WHILE, "while"]]
    @lex.tokenize("a Car\n").should eq [[:A, 'a'], [:CONSTANT, 'Car']]
    @lex.tokenize("an Automobile\n").should eq [[:AN, 'an'], [:CONSTANT, 'Automobile']]
    @lex.tokenize("can curl").should eq [[:CAN, "can"], [:IDENTIFIER, "curl"]]
  end

  it 'should tokenize strings' do
    @lex.tokenize('"testing"').should eq [[:STRING, "testing"]]
  end

  it "should tokenize numbers" do
    @lex.tokenize("5").should eq [[:NUMBER, 5]]
  end

  it 'should tokenize constants' do
    @lex.tokenize("True").should eq [[:CONSTANT, "True"]]
  end

  it 'should tokenize say or puts commands' do
    @lex.tokenize("say 'hello'").should eq [[:IDENTIFIER, "print"], [:STRING, "hello"]]
    @lex.tokenize("puts 'hello'").should eq [[:IDENTIFIER, "print"], [:STRING, "hello"]]
  end

  it 'should tokenize block indicators' do
    @lex.tokenize(":\n").should eq [["{", "{"]]
    @lex.tokenize("eh?\n").should eq [["}", "}"]]
    expect(@lex.tokenize(FULL_CLASS)).not_to include [:IDENTIFIER, "eh"]
  end
end
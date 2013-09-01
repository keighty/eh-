require 'spec_helper'

# racc -vo parser.rb grammar.y

describe Parser do

class_a_test = <<-EOS
a Car:
  "hockey"
eh?
EOS

class_an_test = <<-EOS
an Automobile:
eh?
EOS

  before do
    block = lambda { }
    @nodes = Nodes.new([
      ClassNode.new("Car", "hockey")
    ])
    # p @nodes
  end

  it "should parse A class" do
    # p Lexer.new.tokenize(class_a_test)
    @nodes.should == Parser.new.parse(class_a_test)
  end

  xit "should parse AN class" do
    nodes.should == Parser.new.parse(class_an_test)
  end

  xit 'should parse a class definition' do
    @tokens = Lexer.new.tokenize(BASIC_CLASS)
    p @tokens
    p Parser.new.parse(BASIC_CLASS)

    x = parser.instance_variable_get(:@nodes)

    expect(x.first.class).to be Nodes

    expect(parser.instance_variable_get(:@nodes).first.instance_variable_get(:@nodes).first.instance_variable_get(:@nodes).first.class).to be IfNode

    expect(parser.instance_variable_get(:@nodes).first.instance_variable_get(:@nodes).first.instance_variable_get(:@nodes).first.instance_variable_get(:@condition).class).to be LiteralNode
  end
end
require 'spec_helper'

# racc -vo parser.rb grammar.y

describe Parser do

class_a_test = <<-EOS
a Car:
  pass
eh?
EOS

class_an_test = <<-EOS
an Automobile:
  pass
eh?
EOS

WHILE = <<-EOS
while true:
  pass
eh?
EOS

  it "should parse A class" do
    expect(Parser.new.parse(class_a_test).inspect).to match '<Nodes:'
    expect(Parser.new.parse(class_a_test).inspect).to match 'CallNode'
    expect(Parser.new.parse(class_a_test).inspect).to match '@arguments'
  end

  it "should parse AN class" do
    expect(Parser.new.parse(class_an_test).inspect).to match '<Nodes:'
    expect(Parser.new.parse(class_an_test).inspect).to match 'CallNode'
    expect(Parser.new.parse(class_an_test).inspect).to match '@arguments'
  end

  it 'should parse a class definition' do
    parser = Parser.new.parse(BASIC_CLASS)
    x = parser.instance_variable_get(:@nodes)
    expect(x.first.class).to eq ClassNode
  end

  it 'should parse a while loop' do
    parser = Parser.new.parse(WHILE)
    x = parser.instance_variable_get(:@nodes)
    expect(x.first.class).to eq WhileNode
  end
end
require 'spec_helper'

# racc -vo parser.rb grammar.y

describe "Parser" do
  it 'should parse a class definition' do
    parser = Parser.new.parse(NEXT_SIMPLE)
    x = parser.instance_variable_get(:@nodes)

    expect(x.first.class).to be Nodes

    expect(parser.instance_variable_get(:@nodes).first.instance_variable_get(:@nodes).first.instance_variable_get(:@nodes).first.class).to be IfNode

    expect(parser.instance_variable_get(:@nodes).first.instance_variable_get(:@nodes).first.instance_variable_get(:@nodes).first.instance_variable_get(:@condition).class).to be LiteralNode
  end
end
require "spec_helper"

describe Runtime do
  it 'should run a class' do
    nodes = Parser.new.parse(BASIC_CLASS)
    nodes.eval(Runtime)
  end
end


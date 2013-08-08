class Nodes
  def initialize(nodes)
    @nodes = nodes
  end

  def <<(node)
    @nodes << node
    self
  end

  # last node is return value
  def eval(context)
    @nodes.map { |node| node.eval(context) }.last
  end
end

class LiteralNode
  def initialize(value)
    @value = value
  end

  def eval(context)
    case @value
    when Numeric
      Runtime["Number"].new_value(@value)
    when String
      Runtime["String"].new_value(@value)
    when TrueClass
      Runtime["true"]
    when FalseClass
      Runtime["false"]
    when NilClass
      Runtime["nil"]
    else
      raise "Unknown literal type: " + @value.class.name
    end
  end
end

class CallNode
  def initialize(receiver, method, arguments=[])
    @receiver = receiver
    @method = method
    @arguments = arguments
  end

  # handles method calls with and without params
  def eval(context)
    if @receiver.nil? && context.locals[@method] && @arguments.empty?
      context.locals[@method]
    else
      if @receiver
        receiver = @receiver.eval(context)
      else
        receiver = context.current_self
      end
      arguments = @arguments.map { |arg| arg.eval(context) }
      receiver.call(@method, arguments)
    end
  end
end

class GetConstantNode
  def initialize(name)
    @name = name
  end

  def eval(context)
    context[@name]
  end
end

class SetConstantNode
  def initialize(name, value)
    @name = name
    @value = value
  end

  def eval(context)
    context[@name] = @value.eval(context)
  end
end

class SetLocalNode
  def initialize(name, value)
    @name = name
    @value = value
  end

  def eval(context)
    context.locals[@name] = @value.eval(context)
  end
end

class DefNode
  def initialize(name, params, body)
    @name = name
    @params = params
    @body = body
  end

  def eval(context)
    context.current_class.awesome_methods[@name] = AwesomeMethod.new(@params, @body)
  end
end

class ClassNode
  def initialize(name, body)
    @name = name
    @body = body
  end

  def eval(context)
    awesome_class = AwesomeClass.new
    context[@name] = awesome_class
    @body.eval(Context.new(awesome_class, awesome_class))
    awesome_class
  end
end

class IfNode
  def initialize(condition, body, else_body=nil)
    @condition = condition
    @body = body
    @else_body = else_body
  end

  def eval(context)
    if @condition.eval(context).ruby_value
      @body.eval(context)
    elsif @else_body
      @else_body.eval(context)
    end
  end
end
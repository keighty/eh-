# Represents a Canadian object instance in the Ruby world.
class CanadianObject
  attr_accessor :can_class, :ruby_value

  def initialize(can_class, ruby_value=self)
    @can_class = can_class
    @ruby_value = ruby_value
  end

  # Call a method on the object.
  def call(method, arguments)
    @can_class.lookup(method).call(self, arguments)
  end
end

# Represents a Canadian class in the Ruby world. Classes are objects in Canadian so they inherit from CanadianObject.
class CanadianClass < CanadianObject
  attr_reader :canadian_methods

  # Creates a new class. Number is an instance of Class for example.
  def initialize
    @canadian_methods = {}

    if defined?(Runtime)
      can_class = Runtime["Class"]
    else
      can_class = nil
    end

    super(can_class)
  end

  # Lookup a method
  def lookup(method_name)
    method = @canadian_methods[method_name]
    unless method
      raise "Method not found: #{method_name}"
    end
    method
  end

  # Create a new instance of this Canadian class
  def new
    CanadianObject.new(self)
  end

  # Create an instance of this Canadian class that holds a Ruby value. Like a String, Number or true.
  def new_value(value)
    CanadianObject.new(self, value)
  end
end

# Represents a method defined in Canadaland.
class CanadianMethod
  def initialize(params, body)
    @params = params
    @body = body
  end

  def call(receiver, arguments)
    @body.eval(Context.new(receiver))
  end
end

class Context
  attr_reader :locals, :current_self, :current_class

  @@constants = {}

  def initialize(current_self, current_class=current_self.can_class)
    @locals = {}
    @current_self = current_self
    @current_class = current_class
  end

  # Shortcuts to access constants, Runtime[...] instead of Runtime.constants[...]
  def [](name)
    @@constants[name]
  end
  def []=(name, value)
    @@constants[name] = value
  end
end

# Bootstrap the runtime.
can_class = CanadianClass.new
can_class.can_class = can_class
canadian_object_class = CanadianClass.new

# Create the Runtime object (the root context) on which all code will start its evaluation.
Runtime = Context.new(canadian_object_class.new)

# Register the core classes as constants in the runtime so we can access them from within a program.
Runtime["Class"] = can_class
Runtime["Object"] = canadian_object_class
Runtime["Number"] = CanadianClass.new
Runtime["String"] = CanadianClass.new
Runtime["TrueClass"] = CanadianClass.new
Runtime["FalseClass"] = CanadianClass.new
Runtime["NilClass"] = CanadianClass.new

# Register primitives that map to Ruby values
Runtime["true"] = Runtime["TrueClass"].new_value(true)
Runtime["false"] = Runtime["FalseClass"].new_value(false)
Runtime["nil"] = Runtime["NilClass"].new_value(nil)

# Define some methods in Ruby.
Runtime["Class"].canadian_methods["new"] = proc do |receiver, arguments|
  receiver.new
end
Runtime["Object"].canadian_methods["print"] = proc do |receiver, arguments|
  puts arguments.first.ruby_value
  Runtime["nil"]
end
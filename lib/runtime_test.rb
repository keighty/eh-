require_relative "./parser.rb"
require_relative "./runtime"

code = <<-EOS
a Awesome:
  can work:
    "yeah!"

awesome_object = Awesome.new
if awesome_object:
  print("awesome_object.work: ")
  print(awesome_object.work)
else:
  print("Something is wrong...")
EOS

nodes = Parser.new.parse(code)
nodes.eval(Runtime)
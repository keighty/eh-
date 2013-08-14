SIMPLE = <<-EOS
x < y
EOS

NEXT_SIMPLE = <<-EOS
if true:
  my_canadian = Canadian.new("brilliant!")
else:
  weird
EOS

WHILE_EXPRESSION = <<-EOS
while x < y:
  print x
  x++
print "Done!!"
EOS

IF_EXPRESSION = <<-EOS
if x < y:
  print "special"
EOS

NUMBER_EXPRESSION = <<-EOS
if 5 < 7:
  print "true"
EOS

BASIC_CLASS = <<-EOS
a Factory:
  can produce:
    pass
  eh?
eh?
EOS

FULL_CLASS = <<-EOS
a Canadian:
  can curl:
    if skip:
      say "Hurry!"

  can say_aboot:
    say "What's it all aboot?"
EOS

BAD_DEDENT = <<-EOS
a TestClass:
  can test:
    if x < y:
  puts "something"
EOS

BASIC_CLASS = <<-EOS
a TestClass:
  can go:
    pass
EOS

BAD_INDENT = <<-EOS
a TestClass:
  can test
    puts "something"
EOS
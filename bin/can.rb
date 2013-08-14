#!/usr/bin/env ruby
# The Canadian language!
#
# usage:
#   ./can example.can      # to eval a file
#   ./can                  # to start the REPL
#
# on Windows run with: ruby awesome [options]
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
# require "parser"
# require "runtime"
# require "readline"

# def eval(code)
#   Parser.new.parse(code).eval(Runtime).ruby_value
# end

# # If a file is given we eval it.
# if file = ARGV.first
#   eval File.read(file)

# # Start the REPL, read-eval-print-loop, or interactive interpreter
# else
#   puts "Awesome REPL, CTRL+C to quit"
#   loop do
#     line = Readline::readline(">> ")
#     Readline::HISTORY.push(line)
#     puts "=> #{eval(line).inspect}"
#   end

# end
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'bin'))
require 'canada'

desc 'Run lexer specs'
task :lex do |t|
  exec 'rspec spec/lexer_spec.rb'
end

desc 'Run parser specs'
task :par do |t|
  exec 'rspec spec/parser_spec.rb'
end

desc 'Run runtime specs'
task :runt do |t|
  exec 'rspec spec/runtime_spec.rb'
end

class Parser

# Declare tokens produced by the lexer
token CAN
token A
token AN
token CONSTANT
token NEWLINE

rule
  Root:
    Expressions { result = val[0] }
  ;

  Expressions:
    Expression { result = Nodes.new(val) }
  ;

  Expression:
    Class
  | Constant
  | Block
  ;

  Terminator:
    NEWLINE
  | ";"
  ;

  Constant:
    CONSTANT { result = ConstantNode.new(val[0]) }
  ;

  Class:
    A CONSTANT Block { result = ClassNode.new(val[1], val[2]) }
    | AN CONSTANT Block { result = ClassNode.new(val[1], val[2]) }
  ;

  Block:
    "{" Expressions "}"           { replace = val[1] }
  ;
end

---- header
  require "lexer"
  require "nodes"

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end

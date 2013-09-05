class Parser

# Declare tokens produced by the lexer
token IF ELSE
token CAN
token A
token AN
token NEWLINE
token NUMBER
token STRING
token TRUE FALSE NIL
token IDENTIFIER
token CONSTANT
token INDENT DEDENT

rule
  Root:
    /* nothing */                      { result = Nodes.new([]) }
  | Expressions                        { result = val[0] }
  ;

  Expressions:
    Expression                         { result = Nodes.new(val) }
  | Expressions Terminator Expression  { result = val[0] << val[2] }
    # To ignore trailing line breaks
  | Expressions Terminator             { result = Nodes.new([val[0]]) }
  ;

  Expression:
    Literal
  | Call
  | Constant
  | Assign
  | Def
  | Class
  | If
  ;

  Terminator:
    NEWLINE
  | ";"
  ;

  Literal:
    NUMBER                        { result = LiteralNode.new(val[0]) }
  | STRING                        { result = LiteralNode.new(val[0]) }
  | TRUE                          { result = LiteralNode.new(true) }
  | FALSE                         { result = LiteralNode.new(false) }
  | NIL                           { result = LiteralNode.new(nil) }
  ;

  Call:
    IDENTIFIER                    { result = CallNode.new(nil, val[0]) }
  | IDENTIFIER "(" ArgList ")"    { result = CallNode.new(nil, val[0], val[2]) }
  | Expression "." IDENTIFIER     { result = CallNode.new(val[0], val[2]) }
  | Expression "."
      IDENTIFIER "(" ArgList ")"  { result = CallNode.new(val[0], val[2], val[4]) }
  ;

  ArgList:
    /* nothing */                 { result = [] }
  | Expression                    { result = val }
  | ArgList "," Expression        { result = val[0] << val[2] }
  ;

  Constant:
    CONSTANT                      { result = GetConstantNode.new(val[0]) }
  ;

  Assign:
    IDENTIFIER "=" Expression     { result = SetLocalNode.new(val[0], val[2]) }
  | CONSTANT "=" Expression       { result = SetConstantNode.new(val[0], val[2]) }
  ;

  Def:
    CAN IDENTIFIER Block          { result = DefNode.new(val[1], [], val[2]) }
  | CAN IDENTIFIER
      "(" ParamList ")" Block     { result = DefNode.new(val[1], val[3], val[5]) }
  ;

  ParamList:
    /* nothing */                 { result = [] }
  | IDENTIFIER                    { result = val }
  | ParamList "," IDENTIFIER      { result = val[0] << val[2] }
  ;

  Class:
    A CONSTANT Block          { result = ClassNode.new(val[1], val[2]) }
  | AN CONSTANT Block          { result = ClassNode.new(val[1], val[2]) }
  ;

  If:
    IF Expression Block           { result = IfNode.new(val[1], val[2]) }
  | IF Expression Block NEWLINE
    ELSE Block                    { result = IfNode.new(val[1], val[2], val[5]) }
  ;

  Block:
  "{" Expressions "}"           { result = val[1] }
  ;
end

---- header
  require_relative "./lexer"
  require_relative "./nodes"

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end
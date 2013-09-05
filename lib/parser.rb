#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.9
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require_relative "./lexer"
  require_relative "./nodes"

class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 108)
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end
...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    24,    24,    42,    26,    27,    51,    43,    43,    28,    43,
    25,    25,    21,    31,    18,    19,    20,    58,    11,    12,
    13,    14,    15,    16,    17,    21,    26,    18,    19,    20,
    47,    11,    12,    13,    14,    15,    16,    17,    21,    36,
    18,    19,    20,    26,    11,    12,    13,    14,    15,    16,
    17,    21,    26,    18,    19,    20,    26,    11,    12,    13,
    14,    15,    16,    17,    21,    43,    18,    19,    20,    30,
    11,    12,    13,    14,    15,    16,    17,    21,    53,    18,
    19,    20,    29,    11,    12,    13,    14,    15,    16,    17,
    21,    26,    18,    19,    20,    32,    11,    12,    13,    14,
    15,    16,    17,    21,    22,    18,    19,    20,    59,    11,
    12,    13,    14,    15,    16,    17,    21,    34,    18,    19,
    20,    26,    11,    12,    13,    14,    15,    16,    17,    48,
    60,    49,    49,    56,    43,    57,    62,    43 ]

racc_action_check = [
    52,     2,    30,    33,    16,    42,    33,    30,    16,    32,
    52,     2,    43,    19,    43,    43,    43,    52,    43,    43,
    43,    43,    43,    43,    43,    28,    35,    28,    28,    28,
    36,    28,    28,    28,    28,    28,    28,    28,    49,    26,
    49,    49,    49,    38,    49,    49,    49,    49,    49,    49,
    49,    23,    39,    23,    23,    23,    40,    23,    23,    23,
    23,    23,    23,    23,    47,    31,    47,    47,    47,    18,
    47,    47,    47,    47,    47,    47,    47,     0,    46,     0,
     0,     0,    17,     0,     0,     0,     0,     0,     0,     0,
    21,     3,    21,    21,    21,    20,    21,    21,    21,    21,
    21,    21,    21,    29,     1,    29,    29,    29,    53,    29,
    29,    29,    29,    29,    29,    29,    27,    22,    27,    27,
    27,    55,    27,    27,    27,    27,    27,    27,    27,    37,
    54,    37,    54,    50,    56,    50,    57,    59 ]

racc_action_pointer = [
    75,   104,    -6,    71,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   -14,    60,    56,    -1,
    81,    88,   117,    49,   nil,   nil,    26,   114,    23,   101,
   -16,    42,   -14,   -17,   nil,     6,    12,   110,    23,    32,
    36,   nil,    -8,    10,   nil,   nil,    71,    62,   nil,    36,
   114,   nil,    -7,   105,   111,   101,   111,   123,   nil,   114,
   nil,   nil,   nil,   nil ]

racc_action_default = [
    -1,   -40,    -2,    -3,    -6,    -7,    -8,    -9,   -10,   -11,
   -12,   -15,   -16,   -17,   -18,   -19,   -20,   -27,   -40,   -40,
   -40,   -40,   -40,    -5,   -13,   -14,   -40,   -24,   -40,   -40,
   -40,   -40,   -40,   -40,    64,    -4,   -22,   -40,   -25,   -28,
   -29,   -30,   -32,   -40,   -35,   -36,   -37,   -24,   -21,   -40,
   -40,   -33,   -40,   -40,   -40,   -26,   -40,   -40,   -39,   -40,
   -23,   -31,   -34,   -38 ]

racc_goto_table = [
     2,    41,    44,    45,    46,    33,    37,    35,     1,    50,
   nil,    38,    39,    40,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    54,    61,   nil,   nil,
    63,    38,   nil,    55,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    52 ]

racc_goto_check = [
     2,    13,    13,    13,    13,     3,    12,     3,     1,    14,
   nil,     3,     3,     3,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    12,    13,   nil,   nil,
    13,     3,   nil,     3,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,     8,     0,   -16,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   -21,   -29,   -33 ]

racc_goto_default = [
   nil,   nil,   nil,     3,    23,     4,     5,     6,     7,     8,
     9,    10,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 26, :_reduce_1,
  1, 26, :_reduce_2,
  1, 27, :_reduce_3,
  3, 27, :_reduce_4,
  2, 27, :_reduce_5,
  1, 28, :_reduce_none,
  1, 28, :_reduce_none,
  1, 28, :_reduce_none,
  1, 28, :_reduce_none,
  1, 28, :_reduce_none,
  1, 28, :_reduce_none,
  1, 28, :_reduce_none,
  1, 29, :_reduce_none,
  1, 29, :_reduce_none,
  1, 30, :_reduce_15,
  1, 30, :_reduce_16,
  1, 30, :_reduce_17,
  1, 30, :_reduce_18,
  1, 30, :_reduce_19,
  1, 31, :_reduce_20,
  4, 31, :_reduce_21,
  3, 31, :_reduce_22,
  6, 31, :_reduce_23,
  0, 37, :_reduce_24,
  1, 37, :_reduce_25,
  3, 37, :_reduce_26,
  1, 32, :_reduce_27,
  3, 33, :_reduce_28,
  3, 33, :_reduce_29,
  3, 34, :_reduce_30,
  6, 34, :_reduce_31,
  0, 39, :_reduce_32,
  1, 39, :_reduce_33,
  3, 39, :_reduce_34,
  3, 35, :_reduce_35,
  3, 35, :_reduce_36,
  3, 36, :_reduce_37,
  6, 36, :_reduce_38,
  3, 38, :_reduce_39 ]

racc_reduce_n = 40

racc_shift_n = 64

racc_token_table = {
  false => 0,
  :error => 1,
  :IF => 2,
  :ELSE => 3,
  :CAN => 4,
  :A => 5,
  :AN => 6,
  :NEWLINE => 7,
  :NUMBER => 8,
  :STRING => 9,
  :TRUE => 10,
  :FALSE => 11,
  :NIL => 12,
  :IDENTIFIER => 13,
  :CONSTANT => 14,
  :INDENT => 15,
  :DEDENT => 16,
  ";" => 17,
  "(" => 18,
  ")" => 19,
  "." => 20,
  "," => 21,
  "=" => 22,
  "{" => 23,
  "}" => 24 }

racc_nt_base = 25

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "IF",
  "ELSE",
  "CAN",
  "A",
  "AN",
  "NEWLINE",
  "NUMBER",
  "STRING",
  "TRUE",
  "FALSE",
  "NIL",
  "IDENTIFIER",
  "CONSTANT",
  "INDENT",
  "DEDENT",
  "\";\"",
  "\"(\"",
  "\")\"",
  "\".\"",
  "\",\"",
  "\"=\"",
  "\"{\"",
  "\"}\"",
  "$start",
  "Root",
  "Expressions",
  "Expression",
  "Terminator",
  "Literal",
  "Call",
  "Constant",
  "Assign",
  "Def",
  "Class",
  "If",
  "ArgList",
  "Block",
  "ParamList" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 17)
  def _reduce_1(val, _values, result)
     result = Nodes.new([]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 18)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 22)
  def _reduce_3(val, _values, result)
     result = Nodes.new(val) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 23)
  def _reduce_4(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 25)
  def _reduce_5(val, _values, result)
     result = Nodes.new([val[0]]) 
    result
  end
.,.,

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

module_eval(<<'.,.,', 'grammar.y', 44)
  def _reduce_15(val, _values, result)
     result = LiteralNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 45)
  def _reduce_16(val, _values, result)
     result = LiteralNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 46)
  def _reduce_17(val, _values, result)
     result = LiteralNode.new(true) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 47)
  def _reduce_18(val, _values, result)
     result = LiteralNode.new(false) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 48)
  def _reduce_19(val, _values, result)
     result = LiteralNode.new(nil) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 52)
  def _reduce_20(val, _values, result)
     result = CallNode.new(nil, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 53)
  def _reduce_21(val, _values, result)
     result = CallNode.new(nil, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 54)
  def _reduce_22(val, _values, result)
     result = CallNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 56)
  def _reduce_23(val, _values, result)
     result = CallNode.new(val[0], val[2], val[4]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 60)
  def _reduce_24(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 61)
  def _reduce_25(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 62)
  def _reduce_26(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 66)
  def _reduce_27(val, _values, result)
     result = GetConstantNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 70)
  def _reduce_28(val, _values, result)
     result = SetLocalNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 71)
  def _reduce_29(val, _values, result)
     result = SetConstantNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 75)
  def _reduce_30(val, _values, result)
     result = DefNode.new(val[1], [], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 77)
  def _reduce_31(val, _values, result)
     result = DefNode.new(val[1], val[3], val[5]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 81)
  def _reduce_32(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 82)
  def _reduce_33(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 83)
  def _reduce_34(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 87)
  def _reduce_35(val, _values, result)
     result = ClassNode.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 88)
  def _reduce_36(val, _values, result)
     result = ClassNode.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 92)
  def _reduce_37(val, _values, result)
     result = IfNode.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 94)
  def _reduce_38(val, _values, result)
     result = IfNode.new(val[1], val[2], val[5]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 98)
  def _reduce_39(val, _values, result)
     result = val[1] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser

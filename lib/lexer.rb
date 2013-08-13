class Lexer
  KEYWORDS = ['a', 'can', 'if', 'else', 'while', 'true', 'false', 'nil']

  def tokenize(code)
    code.chomp!
    i = 0
    tokens = []
    current_indent = 0
    indent_stack = []

    while i < code.size
      chunk = code[i..-1]

      # checks keywords
      if identifier = chunk[/\A([a-z]\w*)/, 1]
        if KEYWORDS.include?(identifier)
          tokens << [identifier.upcase.to_sym, identifier]
        else
          tokens << [:IDENTIFIER, identifier]
        end
        i += identifier.size

      # checks for constants
      elsif constant = chunk[/\A([A-Z]\w*)/, 1]
        tokens << [:CONSTANT, constant]
        i += constant.size

      # check for strings
      elsif string = chunk[/\A"(.*?)"/, 1]
        tokens << [:STRING, string]
        i += string.size + 2

      # check for numbers
      elsif number = chunk[/\A([0-9]+)/, 1]
        tokens << [:NUMBER, number.to_i]
        i += number.size

      # checks for indents
      elsif indent = chunk[/\A\:\n( +)/m, 1]
        if indent.size <= current_indent
          raise "Bad indent level: expected #{current_indent}"
        end
        current_indent = indent.size
        indent_stack.push(current_indent)
        tokens << [:INDENT, indent.size]
        i += indent.size + 2

      elsif ending = chunk[/\A\n(eh\?)/, 1]
        indent_stack.pop
        current_indent = indent_stack.first || 0
        tokens << [:DEDENT, current_indent]
        tokens << [:NEWLINE, "\n"]
        i += ending.size + 1

      elsif indent = chunk[/\A\n( *)/, 1]
        if indent.size == current_indent
          tokens << [:NEWLINE, "\n"]
        elsif indent.size < current_indent
          indent_stack.pop
          current_indent = indent_stack.first || 0
          tokens << [:DEDENT, indent.size]
          tokens << [:NEWLINE, "\n"]
        else
          raise "Missing ':'"
        end
        i += indent.size + 1

      elsif chunk.match(/\A /)
        i += 1

      else
        value = chunk[0,1]
        tokens << [value, value]
        i += 1
      end
    end
    tokens
  end
end

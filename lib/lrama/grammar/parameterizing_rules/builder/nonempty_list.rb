module Lrama
  class Grammar
    class ParameterizingRules
      class Builder
        class NonemptyList < Base
          def build
            validate_argument_number!

            rules = []
            nonempty_list_token = Lrama::Lexer::Token::Ident.new(s_value: "nonempty_list_#{@token.s_value}")
            rules << Rule.new(id: @rule_counter.increment, lhs: @lhs, rhs: [nonempty_list_token], token_code: @user_code, precedence_sym: @precedence_sym, lineno: @line)
            rules << Rule.new(id: @rule_counter.increment, lhs: nonempty_list_token, rhs: [@token], token_code: @user_code, precedence_sym: @precedence_sym, lineno: @line)
            rules << Rule.new(id: @rule_counter.increment, lhs: nonempty_list_token, rhs: [nonempty_list_token, @token], token_code: @user_code, precedence_sym: @precedence_sym, lineno: @line)
            rules
          end
        end
      end
    end
  end
end

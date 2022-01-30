module RubyDataStructuresAndAlgorithm
  class Calculator
    OPERATOR_REGEX = %r{[*/+\-]}

    def initialize(expression)
      @expression = expression
    end

    def evaluate
      evaluate_math_expression(@expression.tr(" ", "")).flatten.sum
    end

    private def evaluate_math_expression(expression, negative = false)
      expression.scan(%r{(#{OPERATOR_REGEX})?(.+)}).map do |(operator, expression)|
        if expression[0] == '('
          evaluate_math_expression expression[1...-1], operator == '-'
        else
          # TODO: find a better way to than concat operator with expression
          evaluate_simple_math_expression "#{operator}#{expression}", negative
        end
      end
    end

    private def evaluate_simple_math_expression(expression, negative = false)
      stack = []
      operator = nil

      expression.scan(%r{\d+|#{OPERATOR_REGEX}}) do |match|
          next operator = match if "+*-/".index(match) != nil

          number = match.to_i

          if operator == "+" || operator == nil
              stack << number
          elsif operator == "-"
              stack << -number
          elsif operator == "*"
              stack << stack.pop * number
          elsif operator == "/"
              stack << stack.pop.fdiv(number).to_i
          end
      end

      negative ? -stack.sum : stack.sum
    end
  end
end
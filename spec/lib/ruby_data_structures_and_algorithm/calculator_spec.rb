
require "spec_helper"
require "ruby_data_structures_and_algorithm/calculator"

module RubyDataStructuresAndAlgorithm
  RSpec.describe Calculator do
    describe "#evaluate" do
      shared_examples "expression matcher" do |expression, expected|
        context "expression is #{expression}" do
          it "return #{expected}" do
            expect(Calculator.new(expression).evaluate).to eq(expected)
          end
        end
      end
    
      include_examples "expression matcher", "1+2", 1+2
      include_examples "expression matcher", "(1+2)", (1+2)
      include_examples "expression matcher", "-(1+2)", -(1+2)
      include_examples "expression matcher", "-(1+2*3)", -(1+2*3)
      include_examples "expression matcher", "-(1+2*3/2)", -(1+2*3/2)
      include_examples "expression matcher", "-2+ 1", -2+1
      include_examples "expression matcher", "(3)+1", (3)+1
      include_examples "expression matcher", "2-(5-6)", 2-(5-6)
    end
  end
end

# frozen_string_literal: true

module Stemmerb
  module Operations
    # This will capitalize different instances of Ys in the input word
    # If the first letter is a y, it will be capitalized
    # It will then capitalize all further Ys that are _after_ a vowel
    class CapitalizeY
      def call(input)
        output = first_letter_y?(input) ? input.capitalize : input
        output.gsub(/([aeiouy])y/, '\1Y')
      end

      private

      def first_letter_y?(input)
        input[0] == 'y'
      end
    end
  end
end

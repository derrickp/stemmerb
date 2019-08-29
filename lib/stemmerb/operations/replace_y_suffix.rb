# frozen_string_literal: true

module Stemmerb
  module Operations
    # This will replace the last letter of the input word with an 'i'
    # If the last letter is a 'y' and the previous letter is a consonant
    # Step 1c in the stemming
    class ReplaceYSuffix
      def call(input)
        return input unless input.length > 2
        return input unless ends_in_y?(input)
        return input if second_last_vowel?(input)

        input[0...-1] + 'i'
      end

      private

      def ends_in_y?(input)
        last_letter = input[input.length - 1]
        %w[y Y].include?(last_letter)
      end

      def second_last_vowel?(input)
        second_last = input[input.length - 2]
        vowels.include?(second_last)
      end

      def vowels
        %w[a e i o u y]
      end
    end
  end
end

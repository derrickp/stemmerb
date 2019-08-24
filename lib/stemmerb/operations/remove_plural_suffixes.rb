# frozen_string_literal: true

module Stemmerb
  module Operations
    # Removes the plural suffixes for words
    class RemovePluralSuffixes
      VOWEL_REGEX = /[aeiouy]./.freeze

      def call(input)
        return input[0...input.length - 2] if input.end_with?('sses')
        return remove_ie_ending(input) if ie_ending?(input)
        return input if us_ss_ending?(input)
        return remove_trailing_s(input) if input.end_with?('s')

        input
      end

      private

      def ie_ending?(input)
        input.end_with?('ied') || input.end_with?('ies')
      end

      def remove_ie_ending(input)
        root = input[0...input.length - 3]
        root.length < 2 ? root + 'ie' : root + 'i'
      end

      def us_ss_ending?(input)
        input.end_with?('ss') || input.end_with?('us')
      end

      def remove_trailing_s(input)
        root = input[0...input.length - 1]
        root.match?(VOWEL_REGEX) ? root : input
      end
    end
  end
end

# frozen_string_literal: true

module Stemmerb
  module Operations
    # Removes many adverb suffixes from words
    # e.g. ed/edly/ing/ingly suffixes
    class RemoveAdverbSuffixes
      SUFFIX_REGEX = /(ed|edly|ing|ingly)$/.freeze
      VOWEL_REGEX = /[aeiouy]/.freeze
      TWO_LETTER_SYLLABLE_ENDING_REGEX = /^[aeiouy][^aeiouy]$/.freeze
      SYLLABLE_ENDING_REGEX = /.*[^aeiouy][aeiouy][^aeiouywxY]$/.freeze

      def call(input, region)
        # Replace the eedly with ee
        return input.slice(0...-3) if eedly_within_region?(input, region)
        return input if eedly_outside_region?(input, region)
        return input.slice(0...-1) if eed_within_region?(input, region)
        return input if eed_outside_region?(input, region)

        match = input.match(SUFFIX_REGEX)
        return input unless match

        remove_other_suffixes(input, match, region)
      end

      private

      def within_region?(input, suffix, region)
        input.length - suffix.length >= region
      end

      def outside_region?(input, suffix, region)
        input.length - suffix.length < region
      end

      def eedly_outside_region?(input, region)
        eedly?(input) && outside_region?(input, 'eedly', region)
      end

      def eedly_within_region?(input, region)
        eedly?(input) && within_region?(input, 'eedly', region)
      end

      def eedly?(input)
        input.end_with?('eedly')
      end

      def eed?(input)
        input.end_with?('eed')
      end

      def eed_within_region?(input, region)
        eed?(input) && within_region?(input, 'eed', region)
      end

      def eed_outside_region?(input, region)
        eed?(input) && outside_region?(input, 'eed', region)
      end

      def remove_other_suffixes(input, match, region)
        root = input.slice(0...-match[0].length)

        return suffix_helper(root, region) if input.length > 1 &&
                                              root.match?(VOWEL_REGEX)

        input
      end

      def suffix_helper(input, region)
        return input + 'e' if [
          input.end_with?('at'),
          input.end_with?('bl'),
          input.end_with?('iz'),
        ].any?

        return input.slice(0...-1) if double_ending?(input)
        return input + 'e' if short_word?(input, region) &&
                              ends_with_short_syllable?(input)

        input
      end

      def short_word?(input, region)
        input.length == region
      end

      def ends_with_short_syllable?(input)
        return input.match?(SYLLABLE_ENDING_REGEX) unless input.length == 2

        input.match?(TWO_LETTER_SYLLABLE_ENDING_REGEX)
      end

      def double_ending?(input)
        last_letter = input[input.length - 1]
        last_letter == input[input.length - 2] &&
          double_consonants.include?(last_letter)
      end

      def double_consonants
        %w[b d f g m n p r t]
      end
    end
  end
end

# frozen_string_literal: true

require 'stemmerb/operations/remove_adverb_suffixes'
require 'stemmerb/operations/remove_plural_suffixes'
require 'stemmerb/operations/replace_y_suffix'
require 'stemmerb/result'

module Stemmerb
  module Steps
    # This is Step 1 of the Snowball Porter2 stemming algorithm
    # @return [Stemmerb::Result] The word stemmed to whatever is after Step 1.
    #   Result could be 'done' if the word is an exception and
    #   cannot be stemmed any further.
    class Step1
      def call(input, region)
        output = remove_plural_suffixes(input)
        return build_result(output, true) if exceptions.include?(output)

        output = remove_adverb_suffixes(output, region)
        output = replace_y_suffix(output)
        build_result(output, false)
      end

      private

      def build_result(word, done)
        Stemmerb::Result.new(stemmed: word, done: done)
      end

      def exceptions
        %w[
          inning
          outing
          canning
          herring
          earring
          proceed
          exceed
          succeed
        ]
      end

      def remove_plural_suffixes(input)
        Stemmerb::Operations::RemovePluralSuffixes.new.call(input)
      end

      def remove_adverb_suffixes(input, region)
        Stemmerb::Operations::RemoveAdverbSuffixes.new.call(input, region)
      end

      def replace_y_suffix(input)
        Stemmerb::Operations::ReplaceYSuffix.new.call(input)
      end
    end
  end
end

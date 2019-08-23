# frozen_string_literal: true

module Stemmerb
  module Operations
    # This operation removes the leading apostrophe of the input string
    class RemoveLeadingApostrophe
      def call(input)
        return remove_leading(input) if leading_apostrophe?(input)

        input
      end

      private

      def leading_apostrophe?(input)
        input[0] == "'"
      end

      def remove_leading(input)
        input.slice(1..input.length)
      end
    end
  end
end

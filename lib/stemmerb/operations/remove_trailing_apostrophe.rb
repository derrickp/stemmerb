# frozen_string_literal: true

module Stemmerb
  module Operations
    # Removes the trailing apostrophes from the input.
    # Removes the longest of
    #   - 's'
    #   - 's
    #   - '
    class RemoveTrailingApostrophe
      def call(input)
        if input.end_with?("'s'")
          input[0...input.length - 3]
        elsif input.end_with?("'s")
          input[0...input.length - 2]
        elsif input.end_with?("'")
          input[0...input.length - 1]
        else
          input
        end
      end
    end
  end
end

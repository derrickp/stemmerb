# frozen_string_literal: true

module Stemmerb
  # This object will be returned from each of the step classes
  # It is meant to tell any calling code whether or not the stemming process
  # is at a terminal state.
  # Once it has been marked 'done' then it is terminal
  # and nothing more needs to happen to the word.
  class Result
    attr_accessor :stemmed, :done
    alias done? done

    def initialize(stemmed:, done: false)
      @stemmed = stemmed
      @done = done
    end
  end
end

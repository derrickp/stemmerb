# frozen_string_literal: true

module Stemmerb
  # Defines the different special cases for stemming.
  # These are cases where the stemming algorithm would break
  # what the actual output word would be.
  class SpecialCases
    # All of the special cases at once.
    def all
      [
        special_changes,
        ly_cases,
        invariant_forms,
        non_plural,
      ].inject(&:merge)
    end

    def special_changes
      {
        'skis' => 'ski',
        'skies' => 'sky',
        'dying' => 'die',
        'lying' => 'lie',
        'tying' => 'tie',
      }
    end

    # These are the special -ly ending words
    def ly_cases
      {
        'idly' => 'idl',
        'gently' => 'gentl',
        'ugly' => 'ugli',
        'early' => 'earli',
        'only' => 'onli',
        'singly' => 'singl',
      }
    end

    # These are words that will not be changing,
    # and so do not need to go through the stemming algorithm.
    def invariant_forms
      {
        'sky' => 'sky',
        'news' => 'news',
        'howe' => 'howe',
      }
    end

    # These are words that might look plural to the stemming algorithm,
    # but are definitely not.
    def non_plural
      {
        'atlas' => 'atlas',
        'cosmos' => 'cosmos',
        'bias' => 'bias',
        'andes' => 'andes',
      }
    end
  end
end

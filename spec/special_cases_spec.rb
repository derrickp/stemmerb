# frozen_string_literal: true

require 'spec_helper'
require 'stemmerb/special_cases'

RSpec.describe Stemmerb::SpecialCases do
  describe '#special_changes' do
    subject { described_class.new.special_changes }

    let(:expected) do
      {
        'skis' => 'ski',
        'skies' => 'sky',
        'dying' => 'die',
        'lying' => 'lie',
        'tying' => 'tie',
      }
    end

    it { is_expected.to eq(expected) }
  end
end
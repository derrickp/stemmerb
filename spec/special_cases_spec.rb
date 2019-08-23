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

  describe '#ly_cases' do
    subject { described_class.new.ly_cases }

    let(:expected) do
      {
        'idly' => 'idl',
        'gently' => 'gentl',
        'ugly' => 'ugli',
        'early' => 'earli',
        'only' => 'onli',
        'singly' => 'singl',
      }
    end

    it { is_expected.to eq(expected) }
  end

  describe '#invariant_forms' do
    subject { described_class.new.invariant_forms }

    let(:expected) do
      {
        'sky' => 'sky',
        'news' => 'news',
        'howe' => 'howe',
      }
    end

    it { is_expected.to eq(expected) }
  end
end

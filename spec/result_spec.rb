require 'spec_helper'
require 'stemmerb/result'

RSpec.describe Stemmerb::Result do
  let(:result) { described_class.new(stemmed: word) }
  let(:word) { 'word' }

  describe '#done?' do
    subject { result.done? }

    it { is_expected.to eq(false) }

    context 'after setting done' do
      before do
        result.done = true
      end

      it { is_expected.to eq(true) }
    end
  end
end

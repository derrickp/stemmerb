require 'spec_helper'
require 'stemmerb/operations/remove_trailing_apostrophe'

RSpec.describe Stemmerb::Operations::RemoveTrailingApostrophe do
  describe '#call' do
    subject { described_class.new.call(input) }

    context "given a word ending in 's'" do
      let(:input) { "trait's'" }

      it "removes the 's'" do
        expect(subject).to eq('trait')
      end
    end

    context "given a word ending in 's" do
      let(:input) { "icicle's" }

      it "removes the 's" do
        expect(subject).to eq('icicle')
      end
    end

    context "given a word ending with '" do
      let(:input) { "traits'" }

      it 'removes the apostrophe' do
        expect(subject).to eq('traits')
      end
    end

    context 'given a word with no apostrophe' do
      let(:input) { 'trait' }

      it 'returns the input word' do
        expect(subject).to eq(input)
      end
    end
  end
end

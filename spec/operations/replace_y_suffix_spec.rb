require 'spec_helper'
require 'stemmerb/operations/replace_y_suffix'

RSpec.describe Stemmerb::Operations::ReplaceYSuffix do
  describe '#call' do
    subject { described_class.new.call(input) }

    context 'given a word that does not end in y' do
      let(:input) { 'said' }

      it 'returns the same word' do
        expect(subject).to eq(input)
      end
    end

    context 'given a very short word' do
      let(:input) { 'by' }

      it 'returns the word' do
        expect(subject).to eq(input)
      end
    end

    context 'word ends in y has a vowel as second last letter' do
      let(:input) { 'say' }

      it 'returns the word' do
        expect(subject).to eq(input)
      end
    end

    context 'word ends in y with consonant second last' do
      let(:input) { 'cry' }

      it 'replaces y with i' do
        expect(subject).to eq('cri')
      end
    end

    context 'word ends with capital Y' do
      let(:input) { 'crY' }

      it 'returns the word' do
        expect(subject).to eq('cri')
      end
    end
  end
end

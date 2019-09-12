require 'spec_helper'
require 'stemmerb/steps/step_1'

RSpec.describe Stemmerb::Steps::Step1 do
  let(:step) { described_class.new }

  describe '#call' do
    subject { step.call(word, region) }

    context 'word is an exception' do
      let(:word) { 'innings' }
      let(:region) { 2 }

      it 'returns a done Result' do
        expect(subject.done?).to eq(true)
      end

      it 'returns the word without plural portion' do
        expect(subject.stemmed).to eq('inning')
      end
    end

    context 'word is not an exception' do
      let(:word) { 'unguaranteedly' }
      let(:region) { 2 }

      it 'returns a Result that is not done' do
        expect(subject.done?).to eq(false)
      end

      it 'returns the partially stemmed word' do
        expect(subject.stemmed).to eq('unguarantee')
      end
    end
  end
end

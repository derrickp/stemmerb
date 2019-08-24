require 'spec_helper'
require 'stemmerb/operations/remove_plural_suffixes'

RSpec.describe Stemmerb::Operations::RemovePluralSuffixes do
  describe '#call' do
    subject { described_class.new.call(input) }

    context 'given a word that ends with sses' do
      let(:input) { 'assesses' }

      it 'removes the trailing es' do
        expect(subject).to eq('assess')
      end
    end

    context 'given a word that ends with ies' do
      context 'given a short word' do
        let(:input) { 'ties' }

        it 'only removes the s' do
          expect(subject).to eq('tie')
        end
      end

      context 'given a longer word' do
        let(:input) { 'cries' }

        it 'removes the es' do
          expect(subject).to eq('cri')
        end
      end
    end

    context 'given a word that ends with ied' do
      context 'given a short word' do
        let(:input) { 'tied' }

        it 'only removes the d' do
          expect(subject).to eq('tie')
        end
      end

      context 'given a longer word' do
        let(:input) { 'cried' }

        it 'removes the ed' do
          expect(subject).to eq('cri')
        end
      end
    end

    context 'word ends with us' do
      let(:input) { 'luxurious' }

      it 'leaves the word the same' do
        expect(subject).to eq(input)
      end
    end

    context 'word ends with ss' do
      let(:input) { 'boss' }

      it 'leaves the word the same' do
        expect(subject).to eq(input)
      end
    end

    context 'word ends with s' do
      context 'previous letter is a vowel' do
        let(:input) { 'gas' }

        it 'leaves it the same' do
          expect(subject).to eq(input)
        end
      end

      context 'previous letter is vowel and only vowel in word' do
        let(:input) { 'this' }

        it 'leaves the word alone' do
          expect(subject).to eq(input)
        end
      end

      context 'previous letter is not a vowel' do
        let(:input) { 'gaps' }

        it 'removes the s' do
          expect(subject).to eq('gap')
        end
      end

      context 'the word has more than 1 vowel' do
        let(:input) { 'kiwis' }

        it 'removes the s' do
          expect(subject).to eq('kiwi')
        end
      end
    end

    context 'word does not end with s' do
      let(:input) { 'pizza' }

      it 'leaves the word alone' do
        expect(subject).to eq('pizza')
      end
    end
  end
end

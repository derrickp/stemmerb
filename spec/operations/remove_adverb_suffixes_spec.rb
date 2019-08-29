require 'spec_helper'
require 'stemmerb/operations/remove_adverb_suffixes'

RSpec.describe Stemmerb::Operations::RemoveAdverbSuffixes do
  describe '#call' do
    subject { described_class.new.call(input, region) }

    context 'eedly word within region' do
      let(:input) { 'unguaranteedly' }
      let(:region) { 2 }

      it 'removes the eedly and replaces with ee' do
        expect(subject).to eq('unguarantee')
      end
    end

    context 'eedly word outside region' do
      let(:input) { 'needly' }
      let(:region) { 4 }

      it 'leaves the word the same' do
        expect(subject).to eq(input)
      end
    end

    context 'eed word within region' do
      let(:input) { 'disagreed' }
      let(:region) { 3 }

      it 'removes the d at the end' do
        expect(subject).to eq('disagree')
      end
    end

    context 'eed word outside region' do
      let(:input) { 'greed' }
      let(:region) { 5 }

      it 'leaves the word the same' do
        expect(subject).to eq(input)
      end
    end

    context 'ed word' do
      let(:input) { 'jaded' }
      let(:region) { 3 }

      it 'removes the trailing d' do
        expect(subject).to eq('jade')
      end
    end

    context 'edly word' do
      let(:input) { 'mindedly' }
      let(:region) { 3 }

      it 'removes the edly' do
        expect(subject).to eq('mind')
      end
    end

    context 'ing word' do
      let(:input) { 'minding' }
      let(:region) { 3 }

      it 'removes the ing' do
        expect(subject).to eq('mind')
      end
    end

    context 'ingly word' do
      let(:input) { 'mockingly' }
      let(:region) { 3 }

      it 'removes the ingly' do
        expect(subject).to eq('mock')
      end
    end

    context 'bl word' do
      let(:input) { 'ambling' }
      let(:region) { 2 }

      it 'adds an e to the end of the word' do
        expect(subject).to eq('amble')
      end
    end

    context 'iz word' do
      let(:input) { 'agonizing' }
      let(:region) { 2 }

      it 'adds an e to the end of the word' do
        expect(subject).to eq('agonize')
      end
    end

    context 'at word' do
      let(:input) { 'abdicating' }
      let(:region) { 2 }

      it 'adds an e to the end of the word' do
        expect(subject).to eq('abdicate')
      end
    end

    context 'double-ending word' do
      let(:input) { 'bobbed' }
      let(:region) { 3 }

      it 'removes one of the letters at the end' do
        expect(subject).to eq('bob')
      end
    end

    context 'a short word' do
      let(:input) { 'hoping' }
      let(:region) { 3 }

      it 'adds an e to the end' do
        expect(subject).to eq('hope')
      end
    end
  end
end

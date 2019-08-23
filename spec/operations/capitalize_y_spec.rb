require 'spec_helper'
require 'stemmerb/operations/capitalize_y'

RSpec.describe Stemmerb::Operations::CapitalizeY do
  describe '#call' do
    subject { described_class.new.call(input) }

    context 'leading y' do
      let(:input) { 'yes' }

      it { is_expected.to eq('Yes') }
    end

    context 'y after a vowel' do
      let(:input) { 'pay' }

      it { is_expected.to eq('paY') }

      context 'multiple ys' do
        let(:input) { 'heyday' }

        it { is_expected.to eq('heYdaY') }
      end
    end
  end
end

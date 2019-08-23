require 'spec_helper'
require 'stemmerb/operations/remove_leading_apostrophe'

RSpec.describe Stemmerb::Operations::RemoveLeadingApostrophe do
  describe '#call' do
    subject { described_class.new.call(input) }

    let(:input) { "'something" }

    it { is_expected.to eq('something') }

    context 'given no leading apostrophe' do
      let(:input) { 'something' }

      it { is_expected.to eq(input) }
    end
  end
end

require 'rails_helper'

RSpec.describe RpsGameService::LocalGenerator do
  let(:local_generator) { described_class.new }

  describe '#call' do
    it 'returns one of :rock, :paper, :scissors, or :hammer' do
      expect(local_generator.call).to be_in([:rock, :paper, :scissors, :hammer])
    end
  end
end

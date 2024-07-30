require 'rails_helper'

RSpec.describe RpsGameService::Main do
  let(:user_bet) { 'rock' }
  let(:game_service) { described_class.new(user_bet: user_bet) }

  describe '#result' do
    context 'when user wins' do
      it 'returns :user' do
        allow(game_service).to receive(:generated_bet).and_return(:scissors)
        expect(game_service.result).to eq(:user)
      end
    end

    context 'when server wins' do
      it 'returns :server' do
        allow(game_service).to receive(:generated_bet).and_return(:paper)
        expect(game_service.result).to eq(:server)
      end
    end

    context 'when it is a tie' do
      it 'returns :tie' do
        allow(game_service).to receive(:generated_bet).and_return(:rock)
        expect(game_service.result).to eq(:tie)
      end
    end
  end

  describe '#generated_bet' do
    context 'when remote service is available' do
      it 'calls the remote service' do
        remote_service = instance_double("RpsGameService::RemoteService", available?: true, call: :paper)
        allow(game_service).to receive(:remote_service).and_return(remote_service)
        expect(game_service.generated_bet).to eq(:paper)
      end
    end

    context 'when remote service is not available' do
      it 'calls the local generator' do
        remote_service = instance_double("RpsGameService::RemoteService", available?: false)
        local_generator = instance_double("RpsGameService::LocalGenerator", call: :scissors)
        allow(game_service).to receive(:remote_service).and_return(remote_service)
        allow(game_service).to receive(:local_generator).and_return(local_generator)
        expect(game_service.generated_bet).to eq(:scissors)
      end
    end
  end
end

require 'rails_helper'
require 'net/http'

RSpec.describe RpsGameService::RemoteService do
  let(:remote_service) { described_class.new }
  let(:uri) { URI(described_class::API_URL) }

  describe '#call' do
    context 'when available' do
      before do
        allow(remote_service).to receive(:available?).and_return(true)
      end

      it 'returns one of :rock, :paper, :scissors, or :hammer' do
        expect(remote_service.call).to be_in([:rock, :paper, :scissors, :hammer])
      end
    end

    context 'when not available' do
      before do
        allow(remote_service).to receive(:available?).and_return(false)
      end

      it 'returns nil' do
        expect(remote_service.call).to be_nil
      end
    end

    it 'returns nil unless available' do
      allow(remote_service).to receive(:available?).and_return(false)
      expect(remote_service.call).to be_nil
    end

    %w(rock paper scissors hammer).each_with_index do |item, index|
      it "returns proper RPS value for #{item}" do
        allow(remote_service).to receive(:parse_response).and_return({'result' => index + 1})
        expect(remote_service.call).to eq item.to_sym
      end
    end
  end

  describe '#available?' do
    context 'when response is successful' do
      before do
        allow(Net::HTTP).to receive(:get_response).with(uri).and_return(Net::HTTPOK.new(1.0, "200", "OK"))
      end

      it 'returns true' do
        expect(remote_service.available?).to be true
      end
    end

    context 'when response is not successful' do
      before do
        allow(Net::HTTP).to receive(:get_response).with(uri).and_return(Net::HTTPNotFound.new(1.0, "404", "Not Found"))
      end

      it 'returns false' do
        expect(remote_service.available?).to be false
      end
    end
  end
end

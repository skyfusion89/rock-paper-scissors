require 'net/http'

module RpsGameService
  class RemoteService
    API_URL = 'https://rolz.org/api/?1d4.json'.freeze

    def call
      return unless available?

      dice_roll = parse_response['result']
      [:rock, :paper, :scissors, :hammer][dice_roll - 1]
    end

    def available?
      fetch_response.is_a?(Net::HTTPSuccess)
    end

    private

    def parse_response
      JSON.parse(fetch_response.body)
    end

    def fetch_response
      Rails.logger.info("Fetching response from #{api_uri}") unless @response
      @response ||= Net::HTTP.get_response(api_uri)
    rescue SocketError => e
      Rails.logger.error("Error fetching response from #{api_uri} -> #{e}")
    end

    def api_uri
      URI(API_URL)
    end
  end
end

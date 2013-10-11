module Airbrite
  class Client
    class << self
      attr_accessor :api_key

      def instance
        @instance ||= self.new(self.api_key)
      end
    end

    attr_accessor :http_client

    def initialize(api_key)
      self.http_client = Faraday.new "https://api.airbrite.io/v2", :headers => {
        "Content-Type"  => "application/json",
        "Authorization" => "Bearer #{api_key}"
      }
    end

    [:post, :get, :put].each do |method|
      define_method method do |*args, &block|
        resp = handle_errors { self.http_client.send method, *args, &block }
        parse_json resp
      end
    end

  private

    def handle_errors
      resp = yield

      # raise on timeout
      # raise on non 200 response
      # raise on any other errors
    end

    def parse_json(resp)
      Hashie::Mash.new(MultiJson.load(resp.body))
    end
  end
end

module Airbrite
  class Client
    class << self
      attr_accessor :api_key
      attr_accessor :use_staging

      def instance
        @instance ||= self.new(self.api_key, !!self.use_staging)
      end
    end

    attr_accessor :http_client

    def initialize(api_key, staging=false)
      url = staging ? "https://api-staging.airbrite.io" : "https://api.airbrite.io/v2"
      self.http_client = Faraday.new url, :headers => {
        "Content-Type"  => "application/json",
        "Authorization" => "Bearer #{api_key}"
      }
    end

    [:post, :get, :put].each do |method|
      define_method method do |*args, &block|
        raise Airbrite::MissingApiKey.new if Airbrite::Client.api_key.nil?
        args[0] = "/v2#{args[0]}"
        resp = handle_errors { self.http_client.send method, *args, &block }
        parse_json resp
      end
    end

    def handle_errors
      resp = yield

      return resp if resp.success?

      message = parse_error_message resp

      if resp.status >= 500
        raise Airbrite::ApiError.new(message, resp.status)
      elsif resp.status >= 400
        raise Airbrite::BadRequestError.new(message, resp.status)
      end

      raise Airbrite::ClientError.new(message, resp.status)

    rescue Faraday::Error::ClientError => e
      raise Airbrite::ClientError.new(e.class.name)
    end

    def parse_error_message(resp)
      json = MultiJson.load(resp.body)
      meta = json["meta"]
      "#{meta["error_type"]}: #{meta["error_message"]}"
    rescue
      nil
    end

    def parse_json(resp)
      Hashie::Mash.new(MultiJson.load(resp.body))
    end
  end
end

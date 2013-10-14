require "helper"


describe Airbrite::Client do
  let(:client) { Airbrite::Client.instance }

  context "http methods" do
    [:get, :put, :post].each do |method|
      it "raises a MissingApiKey exception when the api key has not been set for #{method} requests" do
        expect { client.send method }.to raise_exception(Airbrite::MissingApiKey)
      end

      it "delegates to the http_client for #{method} requests" do
        Airbrite::Client.api_key = "boom"
        client.http_client.should_receive(method).with("/v2/url").and_return(:ok)
        client.should_receive(:handle_errors).and_yield
        client.should_receive(:parse_json).with(:ok).and_return(:parsed)
        client.send(method, "/url").should == :parsed
      end

      after do
        Airbrite::Client.api_key = nil
      end
    end
  end

  context "#parse_json" do
    it "dumps the result of parsing the response body into a Mash" do
      response = double("response")
      json = "JSON"
      response.should_receive(:body).and_return(json)
      MultiJson.should_receive(:load).with(json).and_return({:score => 9})
      parsed = client.parse_json response
      parsed.should be_an_instance_of(Hashie::Mash)
      parsed.score.should == 9
    end
  end

  context "#handle_errors" do
    let(:response) { double("response") }
    let(:successful_response) { response.tap { |r| r.stub(:success? => true) } }
    let(:unsuccessful_response) { response.tap { |r| r.stub(:success? => false) } }

    it "passes through the response if successful" do
      client.handle_errors { successful_response }.should == successful_response
    end

    context "unsuccessful responses" do
      before do
        client.stub(:parse_error_message).and_return("boohoo")
      end

      it "raises ApiErrors for 50* status codes" do
        unsuccessful_response.stub(:status => 500)
        expect { client.handle_errors { unsuccessful_response } }.to raise_exception(Airbrite::ApiError)
      end

      it "raises BadRequestError for 40* status codes" do
        unsuccessful_response.stub(:status => 400)
        expect { client.handle_errors { unsuccessful_response } }.to raise_exception(Airbrite::BadRequestError)
      end

      it "raises ClientError for other status codes" do
        unsuccessful_response.stub(:status => 304)
        expect { client.handle_errors { unsuccessful_response } }.to raise_exception(Airbrite::ClientError)
      end

      it "raises ClientError when the http_client raises a ClientError" do
        expect { client.handle_errors { raise Faraday::Error::ClientError.new("foo") } }.to raise_exception(Airbrite::ClientError)
      end
    end
  end

  context "#parse_error_message" do
    let(:response) { double("response") }
    let(:json) { "JSON" }

    before do
      response.should_receive(:body).and_return(json)
    end

    it "parses the response body and returns the error_type and error_message" do
      MultiJson.should_receive(:load).with(json).and_return({"meta" => {"error_type" => "etype", "error_message" => "emsg"}})

      message = client.parse_error_message response
      message.should == "etype: emsg"
    end

    it "returns nil if there is an exception while parsing the message" do
      MultiJson.should_receive(:load).with(json).and_raise
      message = client.parse_error_message response
      message.should be_nil
    end
  end
end

require "helper"

describe Airbrite::Concerns::Fetchable do
  context "#fetch" do
    it "creates a new instance of the class and refreshes it" do
      fetchable = double("fetchable")
      args = {:id => 123}
      Airbrite::Event.should_receive(:new).with(args).and_return(fetchable)
      fetchable.should_receive(:refresh)
      result = Airbrite::Event.fetch args
      result.should == fetchable
    end
  end

  context "#refresh" do
    it "replaces its contents with the data the client gets from the instance_url" do
      event = Airbrite::Event.new
      event._id = 5
      event.name = "click"
      response = double("response")
      response.should_receive(:data).and_return(:_id => 5, :name => "hover")
      Airbrite::Client.instance.should_receive(:get).with(event.instance_url).and_return(response)
      event.refresh
      event.name.should == "hover"
    end
  end
end

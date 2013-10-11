require "helper"

describe Airbrite::Event do
  let(:event) { Airbrite::Event.new }

  it "is an entity" do
    event.should be_a_kind_of(Airbrite::Entity)
  end

  it "is a fetchable" do
    event.should be_a_kind_of(Airbrite::Concerns::Fetchable)
  end

  it "is a listable" do
    event.should be_a_kind_of(Airbrite::Concerns::Listable)
  end

  it "has the correct path" do
    Airbrite::Event.collection_url.should == "/events"
    event._id = 7
    event.instance_url.should == "/events/7"
  end
end

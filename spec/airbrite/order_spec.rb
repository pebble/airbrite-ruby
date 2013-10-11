require "helper"

describe Airbrite::Order do
  let(:order) { Airbrite::Order.new }

  it "is an entity" do
    order.should be_a_kind_of(Airbrite::Entity)
  end

  it "is a fetchable" do
    order.should be_a_kind_of(Airbrite::Concerns::Fetchable)
  end

  it "is a listable" do
    order.should be_a_kind_of(Airbrite::Concerns::Listable)
  end

  it "is a persistable" do
    order.should be_a_kind_of(Airbrite::Concerns::Persistable)
  end

  it "has the correct path" do
    Airbrite::Order.collection_url.should == "/orders"
    order._id = 5
    order.instance_url.should == "/orders/5"
  end
end

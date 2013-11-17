require "helper"

describe Airbrite::Shipment do
  let(:shipment) { Airbrite::Shipment.new }

  it "is an entity" do
    shipment.should be_a_kind_of(Airbrite::Entity)
  end

  it "is a fetchable" do
    shipment.should be_a_kind_of(Airbrite::Concerns::Fetchable)
  end

  it "is a listable" do
    shipment.should be_a_kind_of(Airbrite::Concerns::Listable)
  end

  it "is a persistable" do
    shipment.should be_a_kind_of(Airbrite::Concerns::Persistable)
  end

  it "has the correct path" do
    Airbrite::Shipment.collection_url(:order_id => 50).should == "/orders/50/shipments"
    shipment._id = 56
    shipment.order_id = 80
    shipment.instance_url.should == "/orders/80/shipments/56"
  end

  it "provides default list for line_items" do
    shipment.line_items.should eql([])
  end
end

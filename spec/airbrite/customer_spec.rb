require "helper"

describe Airbrite::Customer do
  let(:customer) { Airbrite::Customer.new }

  it "is an entity" do
    customer.should be_a_kind_of(Airbrite::Entity)
  end

  it "is a fetchable" do
    customer.should be_a_kind_of(Airbrite::Concerns::Fetchable)
  end

  it "is a listable" do
    customer.should be_a_kind_of(Airbrite::Concerns::Listable)
  end

  it "is a persitable" do
    customer.should be_a_kind_of(Airbrite::Concerns::Persistable)
  end

  it "has the correct path" do
    Airbrite::Customer.collection_url.should == "/customers"
    customer._id = 6
    customer.instance_url.should == "/customers/6"
  end
end

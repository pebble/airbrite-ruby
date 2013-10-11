require "helper"

describe Airbrite::Product do
  let(:product) { Airbrite::Product.new }

  it "is an entity" do
    product.should be_a_kind_of(Airbrite::Entity)
  end

  it "is a fetchable" do
    product.should be_a_kind_of(Airbrite::Concerns::Fetchable)
  end

  it "is a listable" do
    product.should be_a_kind_of(Airbrite::Concerns::Listable)
  end

  it "is a persistable" do
    product.should be_a_kind_of(Airbrite::Concerns::Persistable)
  end

  it "has the correct path" do
    Airbrite::Product.collection_url.should == "/products"
    product._id = 99
    product.instance_url.should == "/products/99"
  end
end

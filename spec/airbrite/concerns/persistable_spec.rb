require "helper"

describe Airbrite::Concerns::Persistable do
  context "#create" do
    it "instantiates using the provided hash then saves" do
      persistable = double("persistable")
      hash = {:ban => :jo}
      Airbrite::Product.should_receive(:new).with(hash).and_return(persistable)
      persistable.should_receive(:save)
      result = Airbrite::Product.create hash
      result.should == persistable
    end
  end

  context '#persisted?' do
    it "is not persisted if the id is nil" do
      Airbrite::Product.new.should_not be_persisted
    end

    it "is persisted if the id is not nil" do
      Airbrite::Product.new.tap { |p| p._id = 8 }.should be_persisted
    end
  end

  context '#save' do
    it "replaces its contents with the data returned by a client post to its collection_url when it is not persisted" do
      product = Airbrite::Product.new
      json = "json"
      response = double("response")
      response.should_receive(:data).and_return(:_id => 9)
      MultiJson.should_receive(:dump).with(product).and_return(json)
      Airbrite::Client.instance.should_receive(:post).with(product.class.collection_url, json).and_return(response)
      product.save
      product._id.should == 9
    end

    it "replaces its contents with the data returned by a client put to its instance_url when it is persisted" do
      product = Airbrite::Product.new :_id => 10
      json = "json"
      response = double("response")
      response.should_receive(:data).and_return(:id => 10, :updated => true)
      MultiJson.should_receive(:dump).with(product).and_return(json)
      Airbrite::Client.instance.should_receive(:put).with(product.instance_url, json).and_return(response)
      product.save
      product.should be_updated
    end
  end
end

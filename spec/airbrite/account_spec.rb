require "helper"

describe Airbrite::Account do
  let(:account) { Airbrite::Account.new }

  it "is an entity" do
    account.should be_a_kind_of(Airbrite::Entity)
  end

  it "is a fetchable" do
    account.should be_a_kind_of(Airbrite::Concerns::Fetchable)
  end

  it "has the correct path" do
    account.instance_url.should == "/account"
  end
end

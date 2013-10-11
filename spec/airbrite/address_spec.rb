require "helper"

describe Airbrite::Address do
  let(:address) { Airbrite::Address.new }

  it "is an entity" do
    address.should be_a_kind_of(Airbrite::Entity)
  end
end

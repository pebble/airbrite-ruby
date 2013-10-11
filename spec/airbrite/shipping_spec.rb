require "helper"

describe Airbrite::Shipping do
  let(:shipping) { Airbrite::Shipping.new }

  it "is an entity" do
    shipping.should be_a_kind_of(Airbrite::Entity)
  end
end

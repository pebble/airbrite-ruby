require "helper"

describe Airbrite::Discount do
  let(:discount) { Airbrite::Discount.new }

  it "is an entity" do
    discount.should be_a_kind_of(Airbrite::Entity)
  end
end

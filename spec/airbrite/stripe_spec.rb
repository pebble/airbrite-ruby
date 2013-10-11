require "helper"

describe Airbrite::Stripe do
  let(:stripe) { Airbrite::Stripe.new }

  it "is an entity" do
    stripe.should be_a_kind_of(Airbrite::Entity)
  end
end

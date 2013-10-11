require "helper"

describe Airbrite::Card do
  let(:card) { Airbrite::Card.new }

  it "is an entity" do
    card.should be_a_kind_of(Airbrite::Entity)
  end
end

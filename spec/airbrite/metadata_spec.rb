require "helper"

describe Airbrite::Metadata do
  let(:metadata) { Airbrite::Metadata.new }

  it "is not an entity" do
    metadata.should_not be_a_kind_of(Airbrite::Entity)
  end
end

require "helper"

describe Airbrite::Tax do
  let(:tax) { Airbrite::Tax.new }

  it "is an entity" do
    tax.should be_a_kind_of(Airbrite::Entity)
  end
end

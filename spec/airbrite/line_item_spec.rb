require "helper"

describe Airbrite::LineItem do
  let(:line_item) { Airbrite::LineItem.new }

  it "is an entity" do
    line_item.should be_a_kind_of(Airbrite::Entity)
  end
end

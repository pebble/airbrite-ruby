require "helper"

describe Airbrite::Paging do
  let(:paging) { Airbrite::Paging.new }

  it "is an entity" do
    paging.should be_a_kind_of(Airbrite::Entity)
  end

  it "overrides count" do
    paging["count"] = 5
    paging.foo = :bar
    paging.count.should == 5
  end
end

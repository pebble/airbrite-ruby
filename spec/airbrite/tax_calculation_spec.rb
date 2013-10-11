require "helper"

describe Airbrite::TaxCalculation do
  let(:tax_calculation) { Airbrite::TaxCalculation.new }

  it "is an entity" do
    tax_calculation.should be_a_kind_of(Airbrite::Entity)
  end

  context '#calculate' do
    pending
  end
end

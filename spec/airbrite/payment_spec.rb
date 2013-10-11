require "helper"

describe Airbrite::Payment do
  let(:payment) { Airbrite::Payment.new }

  it "is an entity" do
    payment.should be_a_kind_of(Airbrite::Entity)
  end

  it "is a fetchable" do
    payment.should be_a_kind_of(Airbrite::Concerns::Fetchable)
  end

  it "is a listable" do
    payment.should be_a_kind_of(Airbrite::Concerns::Listable)
  end

  it "is a persistable" do
    payment.should be_a_kind_of(Airbrite::Concerns::Persistable)
  end

  it "has the correct path" do
    Airbrite::Payment.collection_url(:order_id => 2).should == "/orders/2/payments"
    payment._id = 9
    payment.order_id = 17
    payment.instance_url.should == "/orders/17/payments/9"
  end

  context '#charge' do
    pending
  end

  context '#authorize' do
    pending
  end

  context '#capture' do
    pending
  end

  context '#refund' do
    pending
  end
end

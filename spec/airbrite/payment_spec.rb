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

  context "members" do
    before do
      payment.order_id = 123
      payment._id = 456
    end

    let(:response) { double("response") }

    context '#charge' do
      it "replaces its contents with the result of posting to its charge endpoint" do
        response.should_receive(:data).and_return(payment.to_hash.merge(:status => "charged"))
        Airbrite::Client.instance.should_receive(:post).with("#{payment.instance_url}/charge").and_return(response)
        payment.charge
        payment.status.should == "charged"
      end
    end

    context '#authorize' do
      it "replaces its contents with the result of posting to its authorize endpoint" do
        response.should_receive(:data).and_return(payment.to_hash.merge(:status => "authorized"))
        Airbrite::Client.instance.should_receive(:post).with("#{payment.instance_url}/authorize").and_return(response)
        payment.authorize
        payment.status.should == "authorized"
      end
    end

    context '#capture' do
      it "replaces its contents with the result of posting to its capture endpoint" do
        response.should_receive(:data).and_return(payment.to_hash.merge(:status => "captured"))
        Airbrite::Client.instance.should_receive(:post).with("#{payment.instance_url}/capture").and_return(response)
        payment.capture
        payment.status.should == "captured"
      end
    end

    context '#refund' do
      it "replaces its contents with the result of posting to its refund endpoint" do
        response.should_receive(:data).and_return(payment.to_hash.merge(:status => "refunded"))
        Airbrite::Client.instance.should_receive(:post).with("#{payment.instance_url}/refund", {:amount => 25}).and_return(response)
        payment.refund(25)
        payment.status.should == "refunded"
      end
    end
  end
end

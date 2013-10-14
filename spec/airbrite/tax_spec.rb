require "helper"

describe Airbrite::Tax do
  let(:tax) { Airbrite::Tax.new }

  it "is an entity" do
    tax.should be_a_kind_of(Airbrite::Entity)
  end

  context "#calculate" do
    it "retrieves sales tax calculations" do
      args = {:zip => "12345"}
      resp = double("response")
      resp.should_receive(:data).and_return({:sales_tax => 777})
      Airbrite::Client.instance.should_receive(:get).with("/tax", args).and_return(resp)
      tax = Airbrite::Tax.calculate(args)
      tax.should be_an_instance_of(Airbrite::Tax)
      tax.sales_tax.should == 777
    end
  end
end

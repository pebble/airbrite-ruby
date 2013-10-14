require "helper"

describe Airbrite::Entity do
  context "coercion" do
    it "correctly coerces keys" do
      address = {
        :line1 => "925 Alma Street",
        :city => "Palo Alto"
      }

      order = {
        :_id => 8,
        :shipping_address => address
      }

      o = Airbrite::Order.new order

      o.shipping_address = address

      o.shipping_address.should be_an_instance_of(Airbrite::Address)

      address2 = {
        :line1 => "926 Alma Street",
        :city => "Palo Alto"
      }

      o.addresses = [address, address2]

      o.addresses.each { |a| a.should be_an_instance_of(Airbrite::Address) }
    end
  end

  context "#base_name" do
    it "demodulizes and downcases the class name" do
      Airbrite::Entity.base_name.should == "entity"
    end
  end
end

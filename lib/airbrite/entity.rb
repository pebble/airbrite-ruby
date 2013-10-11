module Airbrite
  class Entity < Hashie::Mash
    require "airbrite/account"
    require "airbrite/address"
    require "airbrite/card"
    require "airbrite/customer"
    require "airbrite/discount"
    require "airbrite/event"
    require "airbrite/line_item"
    require "airbrite/metadata"
    require "airbrite/order"
    require "airbrite/payment"
    require "airbrite/product"
    require "airbrite/shipment"
    require "airbrite/shipping"
    require "airbrite/stripe"
    require "airbrite/tax"
    require "airbrite/tax_calculation"

    include Hashie::Extensions::Coercion

    coerce_value :address, Address
    coerce_value :addresses, Address
    coerce_value :billing_address, Address
    coerce_value :default_address, Address
    coerce_value :card, Card
    coerce_value :cards, Card
    coerce_value :customer, Customer
    coerce_value :discount, Discount
    coerce_value :line_items, LineItem
    coerce_value :metadata, Metadata
    coerce_value :payments, Payment
    coerce_value :shipments, Shipment
    coerce_value :shipping, Shipping
    coerce_value :shipping_address, Address
    coerce_value :stripe, Stripe
    coerce_value :tax, Tax

    class << self
      def coerce(value)
        if value.is_a?(Array)
          value.map { |v| self.new(v) }
        else
          self.new(v)
        end
      end

      def instance_url(_id)
        "#{collection_url}/#{_id}"
      end

      def collection_url(args={})
        "/#{base_name}s"
      end

      def base_name
        name.split('::').last.downcase
      end
    end

    def instance_url
      self.class.instance_url _id
    end
  end
end

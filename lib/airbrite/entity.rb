module Airbrite
  class Entity < Hashie::SafeMash
    include Hashie::Extensions::Coercion

    require "airbrite/account"
    require "airbrite/address"
    require "airbrite/card"
    require "airbrite/customer"
    require "airbrite/discount"
    require "airbrite/event"
    require "airbrite/line_item"
    require "airbrite/metadata"
    require "airbrite/order"
    require "airbrite/paging"
    require "airbrite/payment"
    require "airbrite/product"
    require "airbrite/shipment"
    require "airbrite/shipping"
    require "airbrite/stripe"
    require "airbrite/tax"

    class << self
      def coerce(value)
        if value.is_a?(Array)
          value.map { |v| self.new(v) }
        else
          self.new(value)
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

    [Account, Address, Card, Customer, Discount, Event, LineItem, Order, Payment, Product, Shipment, Shipping, Stripe, Tax].each do |cls|
      cls.class_eval do
        coerce_key :address, Address
        coerce_key :addresses, Address
        coerce_key :billing_address, Address
        coerce_key :default_address, Address
        coerce_key :card, Card
        coerce_key :cards, Card
        coerce_key :customer, Customer
        coerce_key :discount, Discount
        coerce_key :line_items, LineItem
        coerce_key :metadata, Metadata
        coerce_key :paging, Paging
        coerce_key :payments, Payment
        coerce_key :shipments, Shipment
        coerce_key :shipping, Shipping
        coerce_key :shipping_address, Address
        coerce_key :stripe, Stripe
        coerce_key :tax, Tax
      end
    end

    def instance_url
      self.class.instance_url _id
    end
  end
end

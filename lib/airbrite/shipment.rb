module Airbrite
  class Shipment < Entity
    include Concerns::Fetchable
    include Concerns::Listable
    include Concerns::Persistable

    def instance_url
      "#{Order.instance_url(order_id)}/shipments/#{_id}"
    end

    def self.collection_url(args)
      "#{Order.instance_url(args[:order_id])}#{super}"
    end
  end
end

module Airbrite
  class Payment < Entity
    include Concerns::Fetchable
    include Concerns::Listable
    include Concerns::Persistable

    def instance_url
      "#{Order.instance_url(order_id)}/payments/#{_id}"
    end

    def self.collection_url(args={})
      "#{Order.instance_url(args[:order_id])}#{super}"
    end

    def charge
    end

    def authorize
    end

    def capture
    end

    def refund
    end
  end
end

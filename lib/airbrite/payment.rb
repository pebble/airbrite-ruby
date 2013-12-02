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
      replace Client.instance.post("#{instance_url}/charge").data
    end

    def authorize
      replace Client.instance.post("#{instance_url}/authorize").data
    end

    def capture
      replace Client.instance.post("#{instance_url}/capture").data
    end

    def refund(amount)
      replace Client.instance.post("#{instance_url}/refund", MultiJson.dump(:amount => amount)).data
    end
  end
end

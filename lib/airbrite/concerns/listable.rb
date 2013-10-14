module Airbrite
  module Concerns
    module Listable
      module ClassMethods
        def list(args={})
          resp = Client.instance.get collection_url(args), filters(args)
          resp.data.map! { |d| self.new(d) }
          resp
        end

        def filters(args)
          f = {}
          f[:limit] = args[:limit].to_i unless args[:limit].nil?
          f[:skip] = args[:skip].to_i unless args[:skip].nil?
          f[:sort] = args[:sort].to_s unless args[:skip].nil?
          f[:order] = args[:order] unless args[:order].nil?
          f[:since] = args[:since].to_i unless args[:since].nil?
          f[:until] = args[:until].to_i unless args[:until].nil?
          f
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end

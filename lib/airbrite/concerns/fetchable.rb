module Airbrite
  module Concerns
    module Fetchable
      module ClassMethods
        def fetch(args={})
          e = self.new(args)
          e.refresh
          e
        end
      end

      module InstanceMethods
        def refresh
          replace Client.instance.get(instance_url).data
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end

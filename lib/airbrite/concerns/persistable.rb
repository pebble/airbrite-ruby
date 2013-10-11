module Airbrite
  module Concerns
    module Persistable
      module ClassMethods
        def create(hash)
          entity = self.new(hash)
          entity.save
          entity
        end
      end

      module InstanceMethods
        def persisted?
          !_id.nil?
        end

        def save
          if persisted?
            replace Client.instance.put(instance_url, MultiJson.dump(self)).data
          else
            replace Client.instance.post(self.class.collection_url, MultiJson.dump(self)).data
          end
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end

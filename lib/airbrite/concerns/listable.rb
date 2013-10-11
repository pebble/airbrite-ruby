module Airbrite
  module Concerns
    module Listable
      module ClassMethods
        def list(args={})
          resp = Client.instance.get collection_url(args), args.slice(:limit, :skip, :sort, :order, :since, :until)
          resp.data.map! { |d| self.new(d) }
          resp

          # limit:  optional
          #         Maximum number of objects to return. Defaults to 100.
          # skip:   optional
          #         Number of objects to skip over before returning results
          # sort:   optional
          #         Which field to sort by
          # order:  optional
          #         Which way to sort (1 or -1 and asc or desc are the same, respectively)
          # since:  optional
          #         Matches all items updated after unix timestamp
          # until:  optional
          #         Matches all items updated before unix timestamp
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end

module Airbrite
  class Customer < Entity
    include Concerns::Fetchable
    include Concerns::Listable
    include Concerns::Persistable
  end
end

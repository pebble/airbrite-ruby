module Airbrite
  class Order < Entity
    include Concerns::Fetchable
    include Concerns::Listable
    include Concerns::Persistable
  end
end

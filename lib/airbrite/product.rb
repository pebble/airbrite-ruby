module Airbrite
  class Product < Entity
    include Concerns::Fetchable
    include Concerns::Listable
    include Concerns::Persistable
  end
end

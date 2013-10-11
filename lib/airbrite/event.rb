module Airbrite
  class Event < Entity
    include Concerns::Fetchable
    include Concerns::Listable
  end
end

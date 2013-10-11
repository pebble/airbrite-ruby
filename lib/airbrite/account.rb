module Airbrite
  class Account < Entity
    include Concerns::Fetchable

    def self.instance_url(*)
      "/account"
    end
  end
end

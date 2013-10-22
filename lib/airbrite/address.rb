module Airbrite
  class Address < Entity
    def zip
      # hack to fix the fact that Hashie::Mash.zip delegates to Enumerable
      self[:zip]
    end
  end
end

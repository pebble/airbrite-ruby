module Airbrite
  class Paging < Entity
    def count
      # hack to fix the fact that Hashie::Mash.count delegates to Hash
      self["count"]
    end
  end
end

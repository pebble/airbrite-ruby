module Airbrite
  class Tax < Entity
    def self.calculate(args)
      resp = Client.instance.get "/tax", args
      self.new resp.data
    end
  end
end

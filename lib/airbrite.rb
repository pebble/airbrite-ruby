# dependencies
require "faraday"
require "hashie"
require "multi_json"

require "airbrite/version"
require "airbrite/client"

require "airbrite/concerns/fetchable"
require "airbrite/concerns/listable"
require "airbrite/concerns/persistable"

require "airbrite/entity"

module Airbrite
  def self.api_key=(key)
    Client.api_key = key
  end
end

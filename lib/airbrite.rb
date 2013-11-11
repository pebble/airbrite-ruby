# dependencies
require "faraday"
require "hashie"
require "airbrite/util/safe_mash"

require "multi_json"

require "airbrite/version"
require "airbrite/errors/airbrite_error"
require "airbrite/errors/api_error"
require "airbrite/errors/bad_request_error"
require "airbrite/errors/client_error"
require "airbrite/errors/missing_api_key"

require "airbrite/client"

require "airbrite/concerns/fetchable"
require "airbrite/concerns/listable"
require "airbrite/concerns/persistable"

require "airbrite/entity"

module Airbrite
  def self.api_key=(key)
    Client.api_key = key
  end

  def self.use_staging=(bool)
    Client.use_staging = bool
  end
end

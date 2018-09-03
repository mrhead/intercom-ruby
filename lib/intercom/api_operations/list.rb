# frozen_string_literal: true

require 'intercom/client_collection_proxy'
require 'intercom/utils'

module Intercom
  module ApiOperations
    module List
      def all
        ClientCollectionProxy.new(Utils.resource_class_to_collection_name(collection_class), client: @client)
      end
    end
  end
end

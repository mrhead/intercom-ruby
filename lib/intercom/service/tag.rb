# frozen_string_literal: true

require 'intercom/service/base_service'
require 'intercom/api_operations/save'
require 'intercom/api_operations/list'
require 'intercom/api_operations/find_all'

module Intercom
  module Service
    class Tag < BaseService
      include ApiOperations::Save
      include ApiOperations::List
      include ApiOperations::FindAll
      include ApiOperations::Delete

      def collection_class
        Intercom::Tag
      end

      def tag(params)
        params['tag_or_untag'] = 'tag'
        create(params)
      end

      def untag(params)
        params['tag_or_untag'] = 'untag'
        users_or_companies(params).each do |user_or_company|
          user_or_company[:untag] = true
        end
        create(params)
      end

      private

      def users_or_companies(params)
        params[:users] || params[:companies]
      end
    end
  end
end

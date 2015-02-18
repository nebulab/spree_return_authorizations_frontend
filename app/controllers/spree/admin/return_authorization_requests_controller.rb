module Spree
  module Admin
    class ReturnAuthorizationRequestsController < BaseController
      def index
        @return_authorizations = Spree::ReturnAuthorization.where(state: 'pending')
      end
    end
  end
end

module Spree
  module Orders
    class ReturnAuthorizationsController < Spree::StoreController
      before_filter :load_order

      def new
        @return_authorization = Spree::ReturnAuthorization.new(order: @order)
        @reasons = Spree::ReturnAuthorizationReason.active
      end

      def create
        @return_authorization = Spree::ReturnAuthorization.new(params[:return_authorization])
      end

      private

      def load_order
        @order = Spree::Order.where( number: params[:order_id] ).first
      end
    end
  end
end

require 'spec_helper'

describe 'Order show', type: :feature do
  context 'when user is authenticated' do
    let(:user)  { create(:user) }
    let(:order) { create(:order_ready_to_ship, user: user) }
    stub_authorization!

    context 'when order is not yet shipped' do
      it 'has no link to return items' do
        visit spree.order_path(order)
        expect(page).to_not have_link Spree.t("return_authorizations_frontend.create_returns")
      end
    end

    context 'when order has been shipped' do
      let(:order) { create(:shipped_order, user: user) }

      context 'when shipment happened after the deadline' do
        before do
          order.shipments.each {|s| s.update_attribute(:shipped_at, 2.days.ago) }
        end

        it 'has a link to return items' do
          visit spree.order_path(order)
          expect(page).to have_link Spree.t("return_authorizations_frontend.create_returns")
        end
      end

      context 'when shipment happened before the deadline' do
        before do
          order.shipments.each {|s| s.update_attribute(:shipped_at, 32.days.ago) }
        end

        it 'has no link to return items' do
          visit spree.order_path(order)
          expect(page).to_not have_link Spree.t("return_authorizations_frontend.create_returns")
        end
      end
    end
  end

  context 'when is a guest order' do
    let(:order) { create(:shipped_order, user: nil, email: 'foo@bar.it') }

    it 'has no link to return items' do
      visit spree.token_order_path(order, order.guest_token)
      expect(page).to_not have_link Spree.t("return_authorizations_frontend.create_returns")
    end
  end
end

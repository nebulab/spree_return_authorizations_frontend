require 'spec_helper'

describe 'Order show', type: :feature do
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
    before do
      order.shipments.each do |shipment|
        shipment.inventory_units.update_all state: 'shipped'
        shipment.update_column('state', 'shipped')
      end
      order.reload
    end

    it 'has a link to return items' do
      visit spree.order_path(order)
      expect(page).to have_link Spree.t("return_authorizations_frontend.create_returns")
    end
  end
end

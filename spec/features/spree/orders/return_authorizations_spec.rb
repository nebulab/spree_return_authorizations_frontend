require 'spec_helper'

describe 'orders/return_authorizations', type: :feature do
  let(:user)  { create(:user) }
  let(:order) { create(:shipped_order, user: user) }

  it 'can visit an order returns page' do
    expect { visit spree.new_order_return_authorization_path(order) }.not_to raise_error
  end

  context 'line items table' do
    it 'has all the order line items' do
      visit spree.new_order_return_authorization_path(order)
      expect(page).to have_selector('table.return-items-table tbody tr', count: order.line_items.count)
    end
  end
end

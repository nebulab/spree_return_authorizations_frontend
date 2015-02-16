require 'spec_helper'

describe 'orders/return_authorizations', type: :feature do
  let(:user)  { create(:user) }
  let(:reason)  { create(:return_authorization_reason) }
  let(:order) { create(:shipped_order, user: user) }

  before do
    reason
    order
  end

  context 'create return' do
    before do
      expect { visit spree.new_order_return_authorization_path(order) }.not_to raise_error
    end

    it 'works' do
      expect {
        find('#return_authorization_return_authorization_reason_id').find(:xpath, 'option[2]').select_option
        fill_in 'return_authorization[memo]', with: 'blablabla'
        click_button 'Create'
      }.to change(Spree::ReturnAuthorization, :count).by(1)
    end
  end

  context 'line items table' do
    it 'has all the order line items' do
      visit spree.new_order_return_authorization_path(order)
      expect(page).to have_selector('table.return-items-table tbody tr', count: order.line_items.count)
    end
  end
end

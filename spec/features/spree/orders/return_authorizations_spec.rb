require 'spec_helper'

describe 'orders/return_authorizations' do
  let(:user)  { create(:user) }
  let(:reason)  { create(:return_authorization_reason) }
  let(:order) { create(:shipped_order, user: user) }

  before do
    sign_in_as!(user)
    reason
    order.shipments.each {|s| s.update_attribute(:shipped_at, 2.days.ago) }
  end

  context 'create return' do
    context 'with valid params' do
      it 'creates return authorization' do
        expect {
          create_return_authorization_for(order)
        }.to change(Spree::ReturnAuthorization, :count).by(1)
      end

      it 'has pending state' do
        create_return_authorization_for(order)
        expect(Spree::ReturnAuthorization.last.state).to eq('pending')
      end
    end

    context 'with invalid params' do
      before do
        allow_any_instance_of(Spree::ReturnAuthorization).to receive(:valid?).and_return(false)
      end

      it 'does not create return authorization' do
        expect {
          create_return_authorization_for(order)
        }.to_not change(Spree::ReturnAuthorization, :count)
      end
    end
  end

  context 'line items table' do
    it 'has all the order line items' do
      visit spree.new_order_return_authorization_path(order)
      expect(page).to have_selector('table.return-items-table tbody tr', count: order.line_items.count)
    end
  end
end

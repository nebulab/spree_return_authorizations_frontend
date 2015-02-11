require 'spec_helper'

describe 'orders/return_authorizations', type: :feature do
  let(:user)  { create(:user) }
  let(:order) { create(:shipped_order, user: user) }

  it 'can visit an order returns page' do
    expect { visit spree.new_order_return_authorization_path(order) }.not_to raise_error
  end
end

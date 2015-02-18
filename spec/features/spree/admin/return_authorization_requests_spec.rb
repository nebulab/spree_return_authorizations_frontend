require 'spec_helper'

describe 'admin/return_authorizations_requests', type: :feature do
  let(:admin)  { create(:admin_user) }
  let(:pending_ra)  { create(:return_authorization, state: 'pending') }
  let(:authorized_ra)  { create(:return_authorization, state: 'authorized') }
  stub_authorization!

  before do
    pending_ra
    authorized_ra
    admin
  end

  context 'index return authorization requests' do
    before do
      visit spree.admin_return_authorization_requests_path
    end

    it 'shows pending authorization requests' do
      expect(page).to have_selector("tr#spree_return_authorization_#{pending_ra.id}")
    end

    it 'does not show authorized authorization requests' do
      expect(page).to_not have_selector("tr#spree_return_authorization_#{authorized_ra.id}")
    end
  end
end

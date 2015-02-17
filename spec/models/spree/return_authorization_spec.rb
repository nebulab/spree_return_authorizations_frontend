require 'spec_helper'

describe Spree::ReturnAuthorization, type: :model do
  let(:return_authorization) { create(:return_authorization) }

  it 'has state pending by default' do
    expect(return_authorization.state).to eq('pending')
  end
end

require 'spec_helper'

describe Spree::Order, type: :model do
  let(:order) { create(:order_ready_to_ship) }
  let(:shipped_order) { create(:shipped_order) }

  describe '#eligible_for_return_authorization?' do

    it 'is false when it has no user' do
      shipped_order.update_attribute(:user, nil)
      shipped_order.reload

      expect(shipped_order.eligible_for_return_authorization?).to be false
    end

    it 'is false when it is not shipped yet' do
      shipped_order.shipments.each {|s| s.update_attribute(:shipped_at, 2.days.ago) }

      expect(order.eligible_for_return_authorization?).to be false
      expect(shipped_order.eligible_for_return_authorization?).to be true
    end

    it 'is false when shipment happened before the deadline' do
      shipped_order.shipments.each {|s| s.update_attribute(:shipped_at, 32.days.ago) }

      expect(shipped_order.eligible_for_return_authorization?).to be false
    end
  end
end

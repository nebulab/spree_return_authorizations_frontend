Spree::Order.class_eval do
  def eligible_for_return_authorization?
    self.user.present? && self.shipments.any? do |s|
      s.shipped? &&
      s.shipped_at.present? &&
      s.shipped_at > Spree::ReturnAuthorizationsFrontendConfiguration[:return_period_duration].days.ago
    end
  end
end

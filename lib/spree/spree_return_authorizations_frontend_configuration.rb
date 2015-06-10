module Spree
  class SpreeReturnAuthorizationsFrontendConfiguration < Preferences::Configuration
    # number of days after shipment the customer can return the product
    preference :return_period_duration, :integer, default: 30
  end
end

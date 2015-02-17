module Features
  module ReturnAuthorizationsHelpers
    def create_return_authorization_for(order)
      visit spree.new_order_return_authorization_path(order)
      find('#return_authorization_return_authorization_reason_id').find(:xpath, 'option[2]').select_option
      fill_in 'return_authorization[memo]', with: 'blablabla'
      click_button 'Create'
    end
  end
end

RSpec.configure do |config|
  config.include Features::ReturnAuthorizationsHelpers, type: :feature
end

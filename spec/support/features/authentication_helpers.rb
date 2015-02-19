module Features
  module AuthenticationHelpers
    def sign_in_as!(user)
      visit '/login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'secret'
      click_button 'Login'
    end
  end
end

RSpec.configure do |config|
  config.include Features::AuthenticationHelpers, type: :feature
end

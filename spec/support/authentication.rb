
module AuthenticationHelper
  def sign_up email, password
    visit new_user_registration_path

    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password

    click_on "Sign up"
  end
end


Rspec.configure do |config|
  config.include AuthenticationHelper, type: :controller
end

require 'spec_helper'

describe "Login" do
  context "Not logged in" do
    describe "Login Page" do
      before do
        visit new_user_session_path
      end

      it "has email field" do
        expect(page).to have_field "Email", type: 'email'
      end

      it "has password field" do
        expect(page).to have_field "Password", type: 'password'
      end

      it "has sign in button" do
        expect(page).to have_button "Sign in"
      end

      it "has sign up link" do
        expect(page).to have_link "Sign up", href: new_user_registration_path
      end
    end

    describe "Home Page" do
      before do
        visit root_url
      end

      it "has login link" do
        expect(page).to have_link "Login", href: new_user_session_path
      end

      it "link is visible" do
        expect(find_link("Login")).to be_visible
      end
    end
  end

  context "Logged in" do
    before do
      sign_up "test_email@example.com", "test_user_password"
    end

    describe "Home Page" do
      before do
        visit root_url
      end

      it "has log out link" do
        expect(page).to have_link "Log out", href: destroy_user_session_path
      end

      it "allows to log out" do
        click_on "Log out"
        expect(page).to have_link "Login"
      end
    end
  end
end

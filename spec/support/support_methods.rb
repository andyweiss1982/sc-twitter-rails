def sign_up
  visit new_user_registration_path
  fill_in 'user_email', with: "andyweiss1982@gmail.com"
  fill_in 'user_password', with: "12345678"
  fill_in 'user_password_confirmation', with: "12345678"
  click_button "Sign up"
end

def search_handle(handle)
  fill_in 'twitter_call_handle', with: handle
  click_button "Search"
end
require "rails_helper"

describe "User searches for a Twitter handle" do

  scenario "and is redirected unless signed in" do
    visit new_twitter_call_path
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "and sees a new Twitter search form if signed in" do
    sign_up
    expect(page).to have_css('.twitter_calls-new')
  end

  scenario "and submits a valid handle" do
    sign_up
    search_handle("andyweiss1982")
    expect(page).to have_content("Success!")
  end

  scenario "or submits an invalid handle" do
    sign_up
    search_handle("djlaksjdlakjdlsajdaslkj")
    expect(page).to have_content("No tweets")
  end
  
end
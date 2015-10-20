require 'rails_helper'

RSpec.describe "twitter_calls/edit", type: :view do
  before(:each) do
    @twitter_call = assign(:twitter_call, TwitterCall.create!(
      :handle => "MyString"
    ))
  end

  it "renders the edit twitter_call form" do
    render

    assert_select "form[action=?][method=?]", twitter_call_path(@twitter_call), "post" do

      assert_select "input#twitter_call_handle[name=?]", "twitter_call[handle]"
    end
  end
end

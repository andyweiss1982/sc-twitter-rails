require 'rails_helper'

RSpec.describe "twitter_calls/new", type: :view do
  before(:each) do
    assign(:twitter_call, TwitterCall.new(
      :handle => "MyString"
    ))
  end

  it "renders new twitter_call form" do
    render

    assert_select "form[action=?][method=?]", twitter_calls_path, "post" do

      assert_select "input#twitter_call_handle[name=?]", "twitter_call[handle]"
    end
  end
end

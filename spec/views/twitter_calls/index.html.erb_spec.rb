require 'rails_helper'

RSpec.describe "twitter_calls/index", type: :view do
  before(:each) do
    assign(:twitter_calls, [
      TwitterCall.create!(
        :handle => "Handle"
      ),
      TwitterCall.create!(
        :handle => "Handle"
      )
    ])
  end

  it "renders a list of twitter_calls" do
    render
    assert_select "tr>td", :text => "Handle".to_s, :count => 2
  end
end

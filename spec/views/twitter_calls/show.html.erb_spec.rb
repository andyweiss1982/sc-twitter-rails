require 'rails_helper'

RSpec.describe "twitter_calls/show", type: :view do
  before(:each) do
    @twitter_call = assign(:twitter_call, TwitterCall.create!(
      :handle => "Handle"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Handle/)
  end
end

require 'rails_helper'

RSpec.describe TwitterCallsHelper, type: :helper do
  describe "parse_mentions" do
    it "turns words that start with '@' into links to new twitter_calls" do
      expect(helper.parse_mentions("hello @andyweiss1982")).to eq("hello <a rel=\"nofollow\" data-method=\"post\" href=\"/twitter_calls?twitter_call%5Bhandle%5D=andyweiss1982\">@andyweiss1982</a>")
    end
  end

  describe "strip_punctuation" do
    it "distills @mentions with punctuation into @mentions sans punctuation" do
      expect(helper.strip_punctuation("@andyweiss1982:")).to eq("@andyweiss1982")
      expect(helper.strip_punctuation("@andyweiss1982's")).to eq("@andyweiss1982")
      expect(helper.strip_punctuation("@andyweiss1982!")).to eq("@andyweiss1982")
    end
  end
end

require 'rails_helper'

RSpec.describe TwitterCall, type: :model do
  
  it { should validate_presence_of(:handle) }
  it { should validate_uniqueness_of(:handle) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug) }
  
  describe '#response' do

    context "for a Twitter user with 25 or more tweets" do
      it "returns exactly 25 tweets" do
        call = TwitterCall.create(handle: 'andyweiss1982', slug: 'andyweiss1982')
        expect(call.response.count).to eq(25)
      end
    end

    context "for a nonexistent Twitter user or a user with no tweets" do
      it "returns an empty array" do
        call = TwitterCall.create(handle: "adfhiasuhiufah", slug: "adfhiasuhiufah")
        expect(call.response).to eq([])
      end
    end
    
  end

end

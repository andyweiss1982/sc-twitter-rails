require 'rails_helper'

RSpec.describe TwitterCall, type: :model do
  
  context 'validations' do

    it { should validate_presence_of(:handle) }
    it { should validate_uniqueness_of(:handle) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }

  end

  context 'API response' do




  end






end

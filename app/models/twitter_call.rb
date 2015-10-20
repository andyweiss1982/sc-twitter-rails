class TwitterCall < ActiveRecord::Base
  validates :handle, presence: true
end

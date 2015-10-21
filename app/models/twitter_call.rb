class TwitterCall < ActiveRecord::Base
  validates :handle, presence: true

  def response
    Rails.cache.fetch(cache_key, expires_in: 5.minutes) do
      begin
        TwitterClient.user_timeline(handle).first(25)
      rescue Twitter::Error::NotFound
        return []
      end
    end
  end
end

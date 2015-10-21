class TwitterCall < ActiveRecord::Base
  validates :handle, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  def response
    Rails.cache.fetch(cache_key, expires_in: 5.minutes) do
      begin
        TwitterClient.user_timeline(handle, count: 25)
      rescue Twitter::Error::NotFound
        return []
      end
    end
  end

  def to_param
    slug
  end
end

class TwitterApi
  def initialize(handle)
    @handle = handle
  end

  def run
    APICache.get("tweets", cache: 300) do
      TwitterClient.user_timeline(@handle).first(25)
    end
  end
end
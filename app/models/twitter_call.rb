class TwitterCall
  def initialize(handle)
    @handle = handle
  end

  def run
    TwitterClient.user_timeline(@handle).first(25)
  end
end
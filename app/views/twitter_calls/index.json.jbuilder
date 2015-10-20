json.array!(@twitter_calls) do |twitter_call|
  json.extract! twitter_call, :id, :handle
  json.url twitter_call_url(twitter_call, format: :json)
end

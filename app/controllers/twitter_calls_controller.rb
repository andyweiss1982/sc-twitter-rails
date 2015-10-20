class TwitterCallsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    handle = params["handle"]
    response = TwitterCall.new(handle).run
    redirect_to twitter_call_path(response: response)
  end

  def show
  end
end

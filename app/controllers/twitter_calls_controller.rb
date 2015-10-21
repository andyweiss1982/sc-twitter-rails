class TwitterCallsController < ApplicationController
  before_action :set_twitter_call, only: [:show, :update]
  before_action :authenticate_user!

  def show
  end

  def new
    @twitter_call = TwitterCall.new
  end

  def create
    @twitter_call = TwitterCall.find_or_initialize_by(twitter_call_params)
    @twitter_call.slug = @twitter_call.handle.downcase.gsub(" ", "-")
    if @twitter_call.save
      if @twitter_call.response.any?
        redirect_to @twitter_call, notice: 'Success!'
      else
        redirect_to request.referrer, alert: "No tweets for user: #{@twitter_call.handle}"
      end
    else
      render :new
    end
  end

  def update
    if @twitter_call.update(twitter_call_params)
      if @twitter_call.response.any?
        redirect_to @twitter_call, notice: 'Success!'
      else
        redirect_to request.referrer, alert: "No tweets for user: #{@twitter_call.handle}"
      end
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_call
      @twitter_call = TwitterCall.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twitter_call_params
      params.require(:twitter_call).permit(:handle)
    end
end

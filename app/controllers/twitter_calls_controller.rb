class TwitterCallsController < ApplicationController
  before_action :set_twitter_call, only: [:show, :update]

  def show
  end

  def new
    @twitter_call = TwitterCall.new
  end

  def create
    @twitter_call = TwitterCall.find_or_initialize_by(twitter_call_params)
    if @twitter_call.save
      redirect_to @twitter_call, notice: 'Twitter call was successfully created.'
    else
      render :new
    end
  end

  def update
    if @twitter_call.update(twitter_call_params)
      redirect_to @twitter_call, notice: 'Twitter call was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_call
      @twitter_call = TwitterCall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twitter_call_params
      params.require(:twitter_call).permit(:handle)
    end
end

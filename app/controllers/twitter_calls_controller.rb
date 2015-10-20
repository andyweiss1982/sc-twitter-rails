class TwitterCallsController < ApplicationController
  before_action :set_twitter_call, only: [:show, :update]

  def show
  end

  def new
    @twitter_call = TwitterCall.new
  end

  def create
    @twitter_call = TwitterCall.new(twitter_call_params)

    respond_to do |format|
      if @twitter_call.save
        format.html { redirect_to @twitter_call, notice: 'Twitter call was successfully created.' }
        format.json { render :show, status: :created, location: @twitter_call }
      else
        format.html { render :new }
        format.json { render json: @twitter_call.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @twitter_call.update(twitter_call_params)
        format.html { redirect_to @twitter_call, notice: 'Twitter call was successfully updated.' }
        format.json { render :show, status: :ok, location: @twitter_call }
      else
        format.html { render :edit }
        format.json { render json: @twitter_call.errors, status: :unprocessable_entity }
      end
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

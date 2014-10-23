class SearchesController < ApplicationController

  def show 
    @shouts = Shout.text_shouts(text_shout_ids)
    @users = User.where("username ILIKE ?", "%#{params[:search]}%")
    @timeline = current_user.timeline.page(params[:page])
  end

  private

  def text_shout_ids
    TextShout.search(params[:search]).pluck(:id)
  end

end

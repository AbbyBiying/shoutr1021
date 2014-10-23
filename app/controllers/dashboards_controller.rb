class DashboardsController < ApplicationController
  def show 

    @text_shout = TextShout.new 
    @picture_shout = PictureShout.new
    @timeline = current_user.timeline.page(params[:page])
  end
end

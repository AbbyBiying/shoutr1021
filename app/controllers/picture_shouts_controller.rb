class PictureShoutsController < ApplicationController
  before_action :require_login

  def create
    @picture_shout = PictureShout.new(picture_shout_params)

    if @picture_shout.save
      current_user.shouts.create(content: @picture_shout)
      flash[:notice] = "Thanks for shouting!"
      redirect_to root_path
    else
      render "dashboards/show"
    end
  end

  private

  def picture_shout_params
    params.require(:picture_shout).permit(:url)
  end
end

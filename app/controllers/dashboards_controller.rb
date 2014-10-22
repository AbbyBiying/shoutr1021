class DashboardsController < ApplicationController
  def show 

    @text_shout = TextShout.new 
    @picture_shout = PictureShout.new
  end
end

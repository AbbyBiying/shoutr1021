class ShoutsController < ApplicationController

  def create
    @shout = current_user.shouts.new(shout_params) 
    @shout.save
    redirect_to dashboard_path, notice:"Thanks for shouting!"
  end

  def shout_params
    params.require(:shout).permit(:content)
    
  end 

end

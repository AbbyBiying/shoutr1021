class FollowsController < ApplicationController
  def create
    user = User.find_by(username: params[:id])

    current_user.follow(user)

    redirect_to user
  end

  def destroy
    user = User.find_by(username: params[:id])

    user.followers.delete(current_user)
    
    redirect_to user
  end
end

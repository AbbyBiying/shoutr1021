class DashboardsController < ApplicationController
  def show
    @user = current_user
    @shout = Shout.new
  end

end

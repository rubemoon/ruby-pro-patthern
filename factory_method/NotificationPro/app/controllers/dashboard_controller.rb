class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @notifications = @user.notifications.includes(:user)
  end
end

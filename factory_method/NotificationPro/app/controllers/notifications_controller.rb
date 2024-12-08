class NotificationsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @notifications = @user.notifications
  end

  def test
    json_input = params[:json_input]
    begin
      data = JSON.parse(json_input)
      # Process the JSON data as needed
      # For example, create a notification
      user = User.find(data["user_id"])
      message = data["message"]
      type = data["notification_type"].to_sym

      notification = NotificationFactory.create_notification(type, user, message)
      redirect_to root_path, notice: "Notification sent!"
    rescue JSON::ParserError => e
      redirect_to test_notifications_path, alert: "Invalid JSON input: #{e.message}"
    end
  end

  def create
    user = User.find(params[:user_id])
    message = params[:notification][:message]
    type = params[:notification][:notification_type].to_sym

    notification = NotificationFactory.create_notification(type, user, message)
    redirect_to root_path, notice: "Notification sent!"
  end
end

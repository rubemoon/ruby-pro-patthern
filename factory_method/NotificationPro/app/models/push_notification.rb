class PushNotification < Notification
  after_create :send_push

  private

  def send_push
    Rails.logger.info("Sending push notification to #{user.name}: #{message}")
  end
end

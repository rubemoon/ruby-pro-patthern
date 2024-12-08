class SmsNotification < Notification
  after_create :send_sms

  private

  def send_sms
    Rails.logger.info("#Sending SMS to #{user.phone}: #{message}")
  end
end

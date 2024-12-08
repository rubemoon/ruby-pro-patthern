class EmailNotification < Notification
 after_create :send_email

  private

  def send_email
    Rails.logger.info("Sending email to #{user.email}: #{message}")
  end
end

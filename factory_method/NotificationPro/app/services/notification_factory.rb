class NotificationFactory
  def self.create_notification(type, user, message)
    case type
    when :email
      EmailNotification.create(user: user, message: message, notification_type: "email")
    when :sms
      SmsNotification.create(user: user, message: message, notification_type: "sms")
    when :push
      PushNotification.create(user: user, message: message, notification_type: "push")
    else
      raise "Unknown notification type: #{type}"
    end
  end
end

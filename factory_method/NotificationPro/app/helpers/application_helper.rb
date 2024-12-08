require "net/http"

module ApplicationHelper
  def user_avatar_url(email, size)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end

  def avatar_exists?(url)
    uri = URI.parse(url)
    request = Net::HTTP.new(uri.host, uri.port)
    request.use_ssl = true
    response = request.request_head(uri.path)
    response.code.to_i == 200
  end

    def tailwind_class_for(flash_type)
      {
        success: "green",
        error: "red",
        alert: "yellow",
        notice: "blue"
      }[flash_type.to_sym] || flash_type.to_s
    end

    def flash_messages(_opts = {})
      flash.each do |msg_type, message|
        next if msg_type == :form_error

        concat(content_tag(:div, message.html_safe, {
          class: "alert transition-opacity duration-1000 ease-in-out p-4 m-4 mt-5 w-3/5 bg-#{tailwind_class_for(msg_type)}-100 border border-#{tailwind_class_for(msg_type)}-400 text-#{tailwind_class_for(msg_type)}-700 rounded-lg opacity-100",
          role: msg_type,
          data: { controller: "flash", flash_target: "alert" }
        }) do
          concat content_tag(:span, message.html_safe, { class: "block sm:inline" })
        end)
      end
      nil
    end
end

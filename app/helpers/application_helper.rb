module ApplicationHelper

  def flash_message
    messages = ""
    [:warn, :success, :error].each {|type|
      if flash[type]
        messages += "<p class=\"message #{type}\">#{flash[type]}</p>"
      end
    }
    messages.html_safe
  end

end

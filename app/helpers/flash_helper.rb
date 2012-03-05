module FlashHelper
  
  def flash_messages
    out = ''
    flash.each do |type, message|
      unless type == :recaptcha_error
        out << content_tag(:div, content_tag(:p, message), :class => "flash #{type}")
      end
    end
    out.html_safe
  end
  
end

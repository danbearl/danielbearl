module ApplicationHelper

  def flash_class(level)

    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end

  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def active_link_to(text, path, options={})
    if /^#{url_for(path)}/ =~ request.path
      options[:class] = "#{options[:class]} active"
    end
    
    link_to text, path, options
  end
  
end

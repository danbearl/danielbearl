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

end

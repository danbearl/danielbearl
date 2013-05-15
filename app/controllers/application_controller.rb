class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:pages)
  expose(:page_slugs) { Page.select(:slug).map(&:slug) }

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      redirect_to :root, notice: "You must be logged in to do that."
      return false
    end
  end
end

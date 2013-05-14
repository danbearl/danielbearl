class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  expose(:pages)
  expose(:page_slugs) { Page.select(:slug).map(&:slug) }

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_admin

  def require_admin
    session[:return_to] = request.original_fullpath
    unless is_admin?
      redirect_to '/admin'
    end
  end

  helper_method :is_admin?

  def is_admin?
    session[:is_admin] == true
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_admin

  helper_method :get_theme

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

  def get_theme
    session.delete(:theme) unless ['doge', 'tommy', 'spongebob'].include?(session[:theme])
    render(session[:theme] ? { partial: 'themes/' + session[:theme] } : { inline: '' }).first
  end
end

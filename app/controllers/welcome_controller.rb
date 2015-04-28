class WelcomeController < ApplicationController
  before_filter :log_visitor
  http_basic_authenticate_with name: 'otter', password: 'hive', only: ['authenticate']

  skip_before_filter :require_admin, only: ['index', 'authenticate', 'background']

  def index
  end

  def info
    @visitor_count = Visitor.count
  end

  def authenticate
    session[:is_admin] = true
    redirect_to request.referer || '/'
  end

  def background
    if params[:name] == 'none'
      session.delete(:background)
    else
      session[:background] = params[:name] + '.' + params[:format]
    end
    redirect_to :back
  end

  private

  def log_visitor
    Visitor.find_or_create_by(ip_addr: request.remote_ip)
  end
end

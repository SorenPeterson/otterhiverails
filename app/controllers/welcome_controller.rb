class WelcomeController < ApplicationController
  before_filter :log_visitor

  def index
  end

  def info
    @visitor_count = Visitor.count
  end

  private

  def log_visitor
    Visitor.find_or_create_by(ip_addr: request.remote_ip)
  end
end

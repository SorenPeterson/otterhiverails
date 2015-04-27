class WelcomeController < ApplicationController
  before_filter :log_visitor
  http_basic_authenticate_with name: 'otter', password: 'hive', only: ['authenticate']

  def index
  end

  def info
    @visitor_count = Visitor.count
  end

  def authenticate
    render inline: 'loggin\' you  in sonny'
  end

  private

  def log_visitor
    Visitor.find_or_create_by(ip_addr: request.remote_ip)
  end
end

class WelcomeController < ApplicationController
  before_filter :log_visitor

  def index
  end

  def info
    @visitor_count = Visitor.count
  end

  def log_visitor
    Visitor.find_or_create_by(session_id: session['session_id'])
  end
end

class ResumesController < ApplicationController
  http_basic_authenticate_with name: 'otter', password: 'hive'

  def index
    render layout: false
  end

  def is_admin?
  end
end

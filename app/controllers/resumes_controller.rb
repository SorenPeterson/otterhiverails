class ResumesController < ApplicationController
  http_basic_authenticate_with name: 'otter', password: 'hive'

  def index
  end
end

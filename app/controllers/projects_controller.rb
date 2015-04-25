class ProjectsController < ApplicationController
  def new
  end

  def create
    name = params[:project][:image].original_filename
    directory = "public/img/projects"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:project][:image].read) }
    # redirect_to "/projects/new"
    redirect_to '/img/projects/' + name
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @projects = Project.all
  end

  def show
  end
end

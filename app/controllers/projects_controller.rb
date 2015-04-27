class ProjectsController < ApplicationController
  skip_before_filter :require_admin, only: ['index']

  def new
  end

  def create
    if(params[:project][:image])
      name = params[:project][:image].original_filename
      directory = "public/img/projects"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:project][:image].read) }
    end

    name ||= ''
    Project.create(project_params.merge(image: name))

    redirect_to "/projects"
  end

  def update
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
  end

  def index
    @projects = Project.all
  end

  def show
  end

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end
end

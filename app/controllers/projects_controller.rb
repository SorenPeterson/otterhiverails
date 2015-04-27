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
    Project.create(project_params.merge(image: name, order_id: Project.count))

    redirect_to "/projects"
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    redirect_to '/projects'
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    id = @project.order_id
    @project.destroy
    Project.update_counters(Project.where('order_id > ?', id), :order_id => -1)
    redirect_to "/projects"
  end

  def index
    @projects = Project.all
  end

  def show
  end

  private

  def save_file(filename)
  end

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end
end

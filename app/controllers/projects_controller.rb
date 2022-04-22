class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy]

  def index
      @projects = Project.all
  end

  def new
      @project = Project.new
  end

  def create
      project = Project.create! project_params
      redirect_to projects_path
  end

  def edit ; end

  def update
    @project.update project_params
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Proyecto eliminado con éxito'
  end

  private

    def project_params
        params.require(:project).permit(:name)
    end

    def find_project
      @project = Project.find params[:id]
    end
end

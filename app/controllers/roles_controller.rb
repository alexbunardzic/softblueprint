class RolesController < ApplicationController
  before_action :set_project
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def new
    @role = @project.roles.build #equivalent to: @role = Role.new(project_id: @project.id)
  end

  def create
    @role = @project.roles.build(role_params)
    if @role.save
      flash[:notice] = "Role has been created."
      redirect_to [@project, @role]
    else
      flash[:alert] = "Role has not been created."
      render :new
    end
  end

  def edit
  end

  def update
    if @role.update(role_params)
      flash[:notice] = "Role has been updated."
      redirect_to [@project, @role]
    else
      flash[:alert] = "Role has not been updated."
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_role
    @role = @project.roles.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :description)
  end
end

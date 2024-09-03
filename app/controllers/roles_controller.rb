class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.all
    render json: @roles
  end

  # GET /roles/:id
  def show
    render json: @role
  end

  # POST /roles
  def create
    @role = Role.new(role_params)
    
    if @role.save
      render json: @role, status: :created
    else
      render json: { errors: @role.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /roles/:id
  def update
    if @role.update(role_params)
      render json: @role
    else
      render json: { errors: @role.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /roles/:id
  def destroy
    @role.destroy
    head :no_content
  end

  private

  def set_role
    @role = Role.find_by(id: params[:id])
    if @role.nil?
      render json: { error: 'Role not found' }, status: :not_found
      return
    end
  end

  def role_params
    params.require(:role).permit(:name, :position, :start_date, :placement_date, :status_id)
  end
end
class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy, :contact_count,:matches_for_role]

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
# GET /roles/:id/matches
def matches_for_role
  @matches = @role.matches
  render json: @matches
end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :position, :start_date, :placement_date, :status_id)
  end
end

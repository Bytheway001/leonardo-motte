class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy, :contact_count, :matches_for_role]

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

  # GET /roles/:id/matches - Para obtener los matches de un rol
  def matches_for_role
    if @role
      @matches = @role.matches.includes(:contact)
      render json: @matches.map { |match| { contact: match.contact.alias, contact_id: match.contact_id } }
    else
      render json: { error: 'Rol no encontrado' }, status: :not_found
    end
  end

  # GET /roles/:id/contact_count - Para obtener el número de contactos asociados a un rol
  def contact_count
    if @role
      contact_count = @role.contacts.count
      render json: { role_id: @role.id, contact_count: contact_count }
    else
      render json: { error: 'Rol no encontrado' }, status: :not_found
    end
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :position, :start_date, :placement_date, :status_id)
  end
end
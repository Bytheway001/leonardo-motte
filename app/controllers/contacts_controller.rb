class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy, :update, :role_count]

  # GET /contacts
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  # GET /contacts/:id
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      render json: @contact, status: :created
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /contacts/:id
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/:id
  def destroy
    @contact.destroy
    head :no_content
  end

  # GET /contacts/:id/role_count
  def role_count
    role_ids = @contact.roles.pluck(:id)
    render json: { contact_id: @contact.id, role_ids: role_ids }
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :li_public, :alias)
  end
end
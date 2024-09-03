class ContactsController < ApplicationController
  before_action :set_contacts, only: [:show, :destroy, :update]

  # GET 
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  # GET /contacts/:id
  def show
    render json: @contact
  end

  # POST
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      render json: @contact, status: :created
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @contact.destroy
    head :no_content
  end

  private

  def set_contacts
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :li_public, :alias)
  end

 
end

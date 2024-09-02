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
   
  end

  # PUT
  def update
  
    if @contact.update(contact_params)
      render json: @contact
   
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

  def json_request?
    request.format.json?
  end
end

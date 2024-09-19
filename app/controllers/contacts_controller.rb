class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy, :employment_histories] # Add employment_histories here

  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def show
    render json: @contact
  end

  def employment_histories
    @employment_histories = @contact.employment_histories
    render json: @employment_histories
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact, status: :created
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
    head :no_content
  end

  private

  def set_contact
    @contact = Contact.find_by(id: params[:id])
    if @contact.nil?
      render json: { error: "Contact not found" }, status: :not_found
    end
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :li_public, :alias)
  end
end
  
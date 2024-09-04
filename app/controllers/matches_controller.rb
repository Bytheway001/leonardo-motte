class MatchesController < ApplicationController
  # POST /matches
  def create
    @match = Match.new(match_params)
    
    if @match.save
      render json: @match, status: :created
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # GET /matches
  def index
    @matches = Match.all
    render json: @matches
  end

  # GET /matches/:id
  def show
    @match = Match.find_by(id: params[:id])
    
    if @match
      render json: @match
    else
      render json: { error: 'Object not found' }, status: :not_found
    end
  end

  # DELETE /matches/:id
  def destroy
    @match = Match.find(params[:id])
    
    if @match.destroy
      head :no_content
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # GET /contacts/:contact_id/matches
  def matches_for_contact
    @contact = Contact.find_by(id: params[:contact_id])
    
    if @contact
      @matches = @contact.matches
      render json: @matches
    else
      render json: { error: 'Contact not found' }, status: :not_found
    end
  end

  private

  # Permite solo los parámetros permitidos para la creación y actualización de matches
  def match_params
    params.require(:match).permit(:contact_id, :role_id)
  end
end


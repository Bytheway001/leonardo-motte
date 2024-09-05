class MatchesController < ApplicationController

  def create
   
    @match = Match.new(match_params)
    
    # Intenta guardar el match en la base de datos
    if @match.save
      render json: @match, status: :created
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # Lista todas las relaciones (matches)
  # GET /matches
  def index
    @matches = Match.all
    render json: @matches
  end

  # Muestra un match específico
  # GET /matches/:id
  def show
    # Busca el match por su ID
    @match = Match.find(id: params[:id])
    if @match
      render json: @match
    else
      render json: { error: 'Object not found' }, status: :not_found
    end
  end


  # DELETE /matches/:id
  def destroy
    if @match.destroy
      head :no_content
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # Obtiene todos los matches asociados a un contacto específico
  # GET /contacts/:contact_id/matches
  def matches_for_contact
    
    @contact = Contact.find(params[:id])

    # Si se encuentra el contacto, busca los matches asociados con ese contacto
    if @contact
      # Incluye los roles asociados a los matches
      @matches = @contact.matches
      # Devuelve una lista de los roles y sus IDs en formato JSON
      render json: @matches.map { |match| { role: match.role.name, role_id: match.role_id } }
    else

      render json: { error: 'Contacto no encontrado' }, status: :not_found
    end
  end

  private

  # Solo permite los parámetros contact_id y role_id para crear o actualizar matches
  def match_params
    params.require(:match).permit(:contact_id, :role_id)
  end
end
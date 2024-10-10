class EducationHistoriesController < ApplicationController
    before_action :set_education_history, only: [:show, :update, :destroy]
  
    def index
      @education_histories = EducationHistory.all
      render json: @education_histories
    end
  
    def show
      render json: @education_history
    end
  
    def create
      @education_history = EducationHistory.new(education_history_params)
      if @education_history.save
        render json: @education_history, status: :created
      else
        render json: { errors: @education_history.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @education_history.update(education_history_params)
        render json: @education_history
      else
        render json: { errors: @education_history.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @education_history.destroy
      head :no_content
    end
  
    private
  
    def set_education_history
      @education_history = EducationHistory.find(params[:id])
      if @education_history.nil?
        render json: { error: "Education History not found" }, status: :not_found
      end
    end
    def education_history_params
        params.require(:education_history).permit(:school_id, :title, :start_date, :degree_date, :undergrad)
      end
  end
  
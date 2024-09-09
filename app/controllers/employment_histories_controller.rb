class EmploymentHistoriesController < ApplicationController
  before_action :set_employment_history, only: [:show, :update, :destroy]

  def index
    @company = Company.find(params[:company_id])
    @employment_histories = @company.employment_histories
    render json: @employment_histories
  end
  def show
    render json: @employment_history
  end

  def create
    @employment_history = EmploymentHistory.new(employment_history_params)
    if @employment_history.save
      render json: @employment_history, status: :created
    else
      render json: { errors: @employment_history.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @employment_history.update(employment_history_params)
      render json: @employment_history
    else
      render json: { errors: @employment_history.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @employment_history.destroy
    head :no_content
  end

  private

  def set_employment_history
    @employment_history = EmploymentHistory.find(params[:id])
  end

  def employment_history_params
    params.require(:employment_history).permit(:start_date, :end_date, :primary, :current, :contact_id, :company_id)
  end
end

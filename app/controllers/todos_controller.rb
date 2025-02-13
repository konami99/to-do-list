class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    
  end

  def create
    # binding.pry
    #render json: {
    #  success: true
    #}
    #respond_to do |format|
    #  format.json
    #end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :completed)
  end
end

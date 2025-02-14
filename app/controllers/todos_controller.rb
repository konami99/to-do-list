class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @todos = Todo.all
    
    # return different format based on request
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @todos }
    end
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: {
        success: true,
        todo: @todo
      }
    else
      render json: {
        success: false,
        errors: @todo.errors.full_messages
      }
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render json: {
        success: true,
        todo: @todo.id
      }
    else
      render json: {
        success: false,
        errors: @todo.errors.full_messages
      }
    end
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: {
        success: true
      }
    else
      render json: {
        success: false,
        errors: todo.errors.full_messages
      }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :completed)
  end
end

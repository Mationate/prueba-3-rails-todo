class TodosController < ApplicationController
  before_action :set_todo, only: %i[show]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)

    if todo.save
      redirect_to root_path, notice: 'Se guardó la tarea con éxito'
    else
      redirect_to root_path, alert: 'No se guardó la tarea, intenta nuevamente'
    end
  end

  def show
  end

  
  
  
  

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end
  

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end


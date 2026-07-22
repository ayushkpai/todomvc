class TodosController < ApplicationController
  before_action :set_todo, only: %i[ edit update destroy ]

  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_path, notice: "Todo was successfully created"
    else
      redirect_to todos_path, alert: "Todo could not be created"
    end
  end

    def update
      if @todo.update(todo_params)
        redirect_to todos_path, notice: "Todo was successfully updated", status: :see_other
      else
        redirect_to todos_path, alert: "Todo could not be updated", status: :see_other
      end
    end

  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_path, alert: "Todo was destroyed", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_todo
      @todo = Todo.find(params.expect(:id))
    end

    def todo_params
      params.expect(todo: [ :name ])
    end
end

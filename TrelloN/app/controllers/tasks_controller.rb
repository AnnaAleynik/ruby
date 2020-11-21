class TasksController < ApplicationController
  layout 'tasks'
  
  # def index
  #   @tasks = Task.actual
  # end

  def show
    @card = Card.find(params[:card_id])
    @task = Task.find(params[:id])
  end

  def new
    @card = Card.find(params[:card_id])
    @task = Task.new
  end

  def edit
    @card = Card.find(params[:card_id])
    @task = Task.find(params[:id])
  end

  def create
    @card = Card.find(params[:card_id])
    @task = Task.new(task_params.merge(card_id: params[:card_id]))
    if @task.save
      redirect_to card_task_path(params['card_id'], @task)
    else
      render 'new'
    end

    # @card.find(params[:card_id)
    # @task = @card.task.create(task_params)
  end

  def update
    @task = Task.find(params[:id])
    # @card = Card.find(params[:card_id])

    if @task.update(task_params)
      redirect_to card_task_path(params[:card_id], @task)
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to card_path(params[:card_id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end

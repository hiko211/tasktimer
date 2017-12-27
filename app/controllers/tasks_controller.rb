class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create

    @task = Task.new(tasks_params)
    @task.user_id = current_user.id
    @task.min = params[:min].to_f
    @task.sec = params[:sec].to_f

    if @task.save
     redirect_to tasks_path
     else
     render 'new'
   end
  end


  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def show
  end


  private
      def tasks_params
        params.require(:task).permit(:title, :content, :tag, :sec, :min)
      end

      def set_task
       @task = Task.find(params[:id])
      end


end

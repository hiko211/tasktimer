class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :destroy]
  before_action :authenticate_user!

  def index
    @todos = Todo.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @todo = Todo.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @todos = Todo.all
    @todo = Todo.new(todos_params)
    @todo.user_id = current_user.id
    respond_to do |format|
     if @todo.save
      format.html
      format.js
     else
      format.js {render :new}
     end
   end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
    #↑todoのindexに飛ぶ
  end

  def edit
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todos_params)
    redirect_to todos_path
   else
    render 'edit'
   end
  end


  private
      def todos_params
        params.require(:todo).permit(:title, :content,  :tag)
      end

      def set_todo
        @todo = Todo.find(params[:id])
      end

end

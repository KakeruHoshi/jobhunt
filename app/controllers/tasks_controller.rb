class TasksController < ApplicationController
    def index
        @show = params[:show]
        if @show == "all" then
            @tasks = Task.where(user_id: current_user.id)
        else
            @tasks = Task.where(completed: 0, user_id: current_user.id)
        end
    end
    def new
        @task = Task.new
    end
    def create
        @task = Task.new(task_params)
        @task.user_id = current_user.id
        @task.save
        # @task = Task.create(task_params)
        redirect_to tasks_path
    end
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to tasks_path
    end
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    private
        def task_params
            params.require(:task).permit(:title, :completed)
        end
end

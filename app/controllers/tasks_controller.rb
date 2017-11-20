class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end  
    
    def create
		@task = Task.new(task_params)
		if @task.save
	    	redirect_to tasks_url
		else
	    	render  :action => :new
		end
    end 
	
	def show
		set_task
	end

	def edit
		set_task
	end

	def update
		set_task
		
		if @task.update_attributes(task_params)
			redirect_to tasks_url			
		else
			render  :action => :edit
		end    
	end	

	def destroy
		set_task
		@task.destroy

		redirect_to tasks_url
	end

    private

    def set_task
	@task = Task.find(params[:id])
    end

    def task_params
	params.require(:task).permit(:name, :due_date, :note, :is_done)
    end	

end

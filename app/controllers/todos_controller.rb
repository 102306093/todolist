class TodosController < ApplicationController
	def index
		@todo = Todo.all
		if params[:done] == "t"
			@todo = Todo.where("status = ?","t")
		elsif params[:done] == "f"
			@todo = Todo.where("status <> ?","t")
		end
	end 

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			redirect_to root_path
		end
	end

	def edit
		@todo=Todo.find(params[:id])
	end

	def update
		@todo=Todo.find(params[:id])
		if @todo.update(todo_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@todo=Todo.find(params[:id])
		@todo.destroy
		redirect_to root_path
	end

	def change
		@todo = Todo.find(params[:id])
		if @todo.status == "t"
			@todo.update_attribute(:status,false)
		else
			@todo.update_attribute(:status,true)
		end
		redirect_to root_path
	end

	private
	def todo_params
		params.require(:todo).permit(:event,:status)
	end
end

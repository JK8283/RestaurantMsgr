class PeopleController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]

	def index
		@people = Person.all
	end

	def show
		@people = Person.find params[:id]
	end

	def new
		@people = Person.new
	end

	def create
		safe_person_params = params.require(:person).permit(:name, :phone, :partysize, :waitminutes)
		@people = Person.new(safe_person_params)
		if @people.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@people = Person.find(params[:id])
	end

	def update
		safe_person_params = params.require(:person).permit(:name, :phone, :partysize, :waitminutes)
		@people = Person.find(params[:id])
		if @people.update(safe_person_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@people = Person.find(params[:id]).destroy
		redirect_to root_path
	end
end

class EntriesController < ApplicationController
	def index
		@entry = Entry.all
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new params[:entry]

		if @entry.save
			redirect_to entries_path
		else
			render :new
		end	
	end

	def edit
	@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])
		if entry.update_attributes params[:entry]
			redirect_to entries_path
		else
			render :edit
		end
	end

	def destroy
		@entry = Entry.find(params[:id])

		@entry.destroy

		redirect_to entries_path
	end
end

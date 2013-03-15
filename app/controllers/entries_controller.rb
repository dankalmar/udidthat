class EntriesController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		if params[:day]
			@date = params[:day].to_date
		else
			@date = Date.today
		end
		@entries = Entry.where(created_at: @date.beginning_of_day..@date.end_of_day)

		@entries_month = Entry.where(created_at: @date.beginning_of_month..@date.end_of_month).map do |d|
			d.created_at.to_date
		end

		@entry = Entry.new
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

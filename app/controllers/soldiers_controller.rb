class SoldiersController < ApplicationController

	skip_before_filter :require_login, only:[:index,:show]

	def index
		@soldiers = Soldier.paginate(:page => params[:page])
	end

	def show
		@soldier = Soldier.find(params[:id])
	end

	def new
		@soldier = Soldier.new
	end

	def create
		@soldier = Soldier.new(params[:soldier])
		@soldier.save!
		redirect_to root_path
	end

	def edit
		@soldier = Soldier.find(params[:id])
	end

	def update
		@soldier = Soldier.find(params[:id])
		@soldier.update_attributes(params[:soldier])
		@soldier.save!
		redirect_to root_path
	end

	def destroy
		@soldier = Soldier.find(params[:id])
		@soldier.destroy
		redirect_to root_path
	end

end

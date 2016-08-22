class TagsController < ApplicationController
	
	before_action :authenticated_user, except: [:index, :show]
	
	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to tags_path
	end

end
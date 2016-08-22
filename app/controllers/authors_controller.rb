class AuthorsController < ApplicationController

	before_action :no_authors_or_authenticated, only: [:new, :create]
	before_action :authenticated_user, except: [:new, :create]

	def show
		@author = Author.find(params[:id])
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.create(author_params)
		if @author.save
		else
			render "new"
		end
	end

	private

		def author_params
			params.require(:author).permit(:username, :email, :password, :password_confirmation)
		end

		def no_authors_or_authenticated
			unless Author.count == 0 || current_user
				return false
				redirect_to root_path
			end
		end
end
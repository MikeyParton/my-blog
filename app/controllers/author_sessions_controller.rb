class AuthorSessionsController < ApplicationController
	def new
	end

	def create
		if login(params[:email], params[:password])
			redirect_back_or_to(articles_path)
			flash[:success] = "Logged In"
		else
			flash[:danger] = "Login Failed"
			render "new"
		end
	end

	def destroy
		logout
		redirect_to root_path
		flash[:success] = "Logged Out"
	end
end

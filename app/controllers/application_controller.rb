class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

	  def authenticated_user
		unless current_user
			return false
			redirect_to root_path
		end
	  end
end
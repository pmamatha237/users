class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?

	def authenticate_user!
		
    	@current_user = User.find_by(id: params[:user_id])

    	# @user = User.find_by(id: params[:user_id])
    end
   
    add_flash_types :error
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	
    def configure_permitted_parameters
		 devise_parameter_sanitizer.permit(:Sign_up, keys:  [:email, :password, address_attributes: [:country, :state, :city, :street, :user_id, :name]])
	end

end

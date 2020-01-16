class AddressesController < ApplicationController
	before_action :authenticate_user!

    def index
		@addresses = current_user.addresses.all
      # @addresses = Address.all
	end

	def new
  	    @address = current_user.addresses.new
        # @address = Address.new
    end
    def create
  	   @address = current_user.addresses.new(address_params)
       # @address = Address.new(address_params)
       if @address.save
       redirect_to addresses_path, notice: 'Succesfully created.'
       else
       	
       	# render action: 'new', notice: 'Fill all Blanks'
        flash.now[:error] = "Enter all Details"
        render :new
       end
      
    end

    def edit
	  @address = current_user.addresses.find(params[:id])
     # @address = Address.find(params[:id])
    end

	def update
		@address = current_user.addresses.find(params[:id])
    # @address = Address.find(params[:id])
		@address.update (address_params)
		redirect_to addresses_path, notice: 'Succesfully Updated.'
	end

	def show

		@address = current_user.addresses.find(params[:id])
    # @address = Address.find(params[:id])
	end

    def destroy
	  @address = current_user.addresses.find(params[:id])
    # @address = Address.find(params[:id])
	  @address.delete
	  redirect_to addresses_path, notice: 'Successfully Deleted'
	end

	private
    def address_params
      params.require(:address).permit(:name, :user_id, :street, :city, :state, :country)
    end
end
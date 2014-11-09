class CustomDevise::RegistrationsController < Devise::RegistrationsController
	def new
		@registration = User.new
	end

	def create
		@registration = User.new(permit_params)
		if @registration.save
			sign_in(@registration)
			redirect_to users_path
		else
			render :new
		end
	end

	private

	def permit_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :skill, :desc, :corp, :position, :avatar, :industry_id)
	end
end
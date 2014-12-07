class CustomDevise::RegistrationsController < Devise::RegistrationsController
	def new
		@registration = User.new
	end

	def create
		return @invitation_code_error = true unless InvitationCode.find_by(code: params[:invitation_code])
		@registration = User.new(permit_params)
		if @registration.save
			sign_in @registration
			InvitationCode.find_by_code(params[:invitation_code]).update_attributes(used_by: @registration.id)
		else
			return false
		end
	end

	def update
		@registration = User.find(params[:registration_id])
		respond_to do |format|
			if @registration.update_attributes(permit_params)
				if @registration.registration_ongoing?
					@registration.registration_finished!
					format.js
				else
					sign_in @registration
					format.html { redirect_to users_path }
				end
			else
				return false
			end
		end
	end

	private

	def permit_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :skill, :desc, :corp, :position, :avatar, :industry_id)
	end
end
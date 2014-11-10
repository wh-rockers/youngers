class InvitationsController < ApplicationController
  def create
  	@invitation = Invitation.new(permit_params)
  	respond_to do |format|
	  	if @invitation.save
	  		format.js
	  	end
	  end
  end

  private
  def permit_params
  	params.require(:invitation).permit(:to_user_id, :from_user_id)
  end
end

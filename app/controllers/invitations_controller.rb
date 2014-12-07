class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new(to_user_id: params[:to_user_id])
  end

  def create
  	@invitation = Invitation.new(permit_params)
    puts '==========1'
  	respond_to do |format|
	  	if @invitation.save
	  		format.js
	  	end
	  end
  end

  private
  def permit_params
  	params.require(:invitation).permit(:to_user_id, :from_user_id, :note)
  end
end

class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new(to_user_id: params[:to_user_id])
  end

  def create
  	@invitation = Invitation.new(permit_params)
  	respond_to do |format|
	  	if @invitation.save
	  		format.js
	  	end
	  end
  end

  def update
    @invitation = Invitation.find(params[:id])
    if permit_params.fetch('state', 'refuse') == 'allow'
      @invitation.allow!
    elsif 
      @invitation.refuse!
    end
  end

  def as_read
    @invitation = Invitation.find(params[:id])
    @invitation.toggle!(:read)
  end

  private
  def permit_params
  	params.require(:invitation).permit(:to_user_id, :from_user_id, :note, :state)
  end
end

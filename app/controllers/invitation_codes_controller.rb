class InvitationCodesController < ApplicationController
  def new
    if params[:type] == 'group'
      @invitation_code = InvitationCode.new(user_id: current_user.id)
    end
  end

  def create
    if params[:invitation_code].present?
      @code = InvitationCode.create(user_id: current_user.id, code: permit_params[:code], group_code: true)
    else
      @code = InvitationCode.create(user_id: current_user.id)
    end
  end

  private

  def permit_params
    params.require(:invitation_code).permit(:group_code, :code)
  end
end

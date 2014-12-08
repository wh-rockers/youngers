class InvitationCodesController < ApplicationController
  def create
    @code = InvitationCode.create(user_id: current_user.id)
  end
end

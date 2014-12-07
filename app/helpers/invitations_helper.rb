module InvitationsHelper
  def notification_word(invitation)
    return "拒绝了你的邀请" if invitation.refuse?
    "通过了你的邀请， 你可以在好友列表中查看该好友联系信息"
  end
end

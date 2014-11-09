require "test_helper"

class InvitationTest < ActiveSupport::TestCase

  def invitation
    @invitation ||= Invitation.new
  end

  def test_valid
    assert invitation.valid?
  end

end

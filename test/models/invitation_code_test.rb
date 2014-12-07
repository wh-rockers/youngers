require "test_helper"

class InvitationCodeTest < ActiveSupport::TestCase

  def invitation_code
    @invitation_code ||= InvitationCode.new
  end

  def test_valid
    assert invitation_code.valid?
  end

end

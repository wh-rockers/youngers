require "test_helper"

class RemarkTest < ActiveSupport::TestCase

  def remark
    @remark ||= Remark.new
  end

  def test_valid
    assert remark.valid?
  end

end

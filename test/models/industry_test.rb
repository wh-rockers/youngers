require "test_helper"

class IndustryTest < ActiveSupport::TestCase

  def industry
    @industry ||= Industry.new
  end

  def test_valid
    assert industry.valid?
  end

end

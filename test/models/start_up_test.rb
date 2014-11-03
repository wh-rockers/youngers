require "test_helper"

class StartUpTest < ActiveSupport::TestCase

  def start_up
    @start_up ||= StartUp.new
  end

  def test_valid
    assert start_up.valid?
  end

end

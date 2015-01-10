require "test_helper"

class PlaceTest < ActiveSupport::TestCase

  def place
    @place ||= Place.new
  end

  def test_valid
    assert place.valid?
  end

end

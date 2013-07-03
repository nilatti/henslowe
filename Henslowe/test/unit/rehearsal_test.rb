require 'test_helper'

class RehearsalTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Rehearsal.new.valid?
  end
end

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  setup do
    @visit = visits :one
  end

  test 'associations' do
    assert @visit.slide == slides(:one)
  end
end

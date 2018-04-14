require 'test_helper'

class Stripe::Id::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Stripe::Id
  end
end

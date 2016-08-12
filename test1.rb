require 'test/unit'

class TestSample < Test::Unit::TestCase
  def test_foo
    assert_true(1 == 1)
  end
  def test_bar
    assert_equal(1, 1)
  end
end

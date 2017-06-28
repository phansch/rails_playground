require 'test_helper'

class StepTest < Minitest::Test
  def test_it_works
    skip
    step = Step.new(DummyTask.new)
  end
end

require 'test_helper'

class BackgroundTaskExecutorTest < Minitest::Test
  def test_
    specific_task = DummyTask.new
    executor = BackgroundTaskExecutor.new(specific_task)
    executor.call(:validation)
    executor.call(:import)

  end
end

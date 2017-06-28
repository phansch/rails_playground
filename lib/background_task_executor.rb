# A BackgroundTask can have many steps, each step
# can start a new sidekiq job
class BackgroundTaskExecutor
  class NotImplementedError < StandardError; end

  def initialize(specific_task)
    @specific_task = specific_task
    @steps = @specific_task.steps
  end

  def call(name)
    @current_step = @steps.find { |s| s.name == name }
    Sidekiq::Client.push(
      'class' => @current_step.worker,
      'args' => @current_step.worker_args
    )
  end
end

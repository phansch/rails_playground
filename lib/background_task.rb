# A BackgroundTask can have many steps, each step
# can start a new sidekiq job
class BackgroundTask
  def initialize(specific_task)
    @specific_task = specific_task
  end

  def do_step(step = nil)
    step ||= @specific_task.class::STEPS.first
    job = @specific_task.send("job_class_for_#{step}")
    Sidekiq::Client.push(
      'class' => job.fetch(:klass),
      'args' => job.fetch(:args)
    )
  end
end

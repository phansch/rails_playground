module BackgroundTasks
  class BatchImport
    def steps
      [
        Step.new(:validation,
          worker: SomeValidationJob,
          worker_args: []
        ),
        Step.new(:import,
          worker: SomeValidationJob,
          worker_args: []
        )
      ]
    end
  end
end

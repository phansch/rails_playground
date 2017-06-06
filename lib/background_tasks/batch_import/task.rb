require 'background_tasks/batch_import/some_validation_job'

module BackgroundTasks
  module BatchImport
    class Task
      STEPS = %i[validation import].freeze

      def job_class_for_validation
        {
          klass: SomeValidationJob,
          args: []
        }
      end

      def job_class_for_import
        {
          klass: SomeValidationJob,
          args: []
        }
      end
    end
  end
end

module BackgroundTasks
  module BatchImport
    class SomeValidationJob
      include Sidekiq::Worker
      sidekiq_options retry: false

      def perform(*args)
        # do the work
      end
    end
  end
end

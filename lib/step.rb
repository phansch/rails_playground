class Step
  attr_reader :name, :worker, :worker_args

  def initialize(name, worker: :none, worker_args: [])
    @name = name
    @worker = worker
    @worker_args = worker_args
  end

  def next_step

  end
end

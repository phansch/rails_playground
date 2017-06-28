require 'background_task'
require 'background_tasks/batch_import/task'
require 'background_tasks/batch_import/some_validation_job'

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new

    if @task.save
      task_to_start = "BackgroundTasks::#{task_params[:type]}::Task".constantize.new
      BackgroundTask.new(task_to_start).do_step
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(
        :type
      )
    end
end

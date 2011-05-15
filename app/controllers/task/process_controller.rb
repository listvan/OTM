class Task::ProcessController < ApplicationController
  def create
    @task = Task.find(params[:id])
    @process = @task.processes.new
    
    Task::Process.transaction do
      @process.started_at = Time.now
      @process.save!
    end
    redirect_to task_path(@task)
  end
end

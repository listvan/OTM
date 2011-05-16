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

  def update
    @process = Task::Process.find(params[:process_id].to_i)
    Task::Process.transaction do
      @process.update_attribute(:finished_at, Time.now)
      @process.update_attribute(:description, params[:task_process][:description])
    end
    redirect_to task_path(@process.task)
  end
end

class TasksController < ApplicationController
  respond_to :html

  def index
    @tasks = Task.scoped
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    respond_with(@task)
  end

  def create
    @task = Task.new(params[:task])

    Task.transaction do
      @task.save!
      flash[:notice] = 'models.task.created_successfully'
      redirect_to(tasks_path)
    end
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'models.task.create_failed'
    render :action => :new, :status => :not_acceptable
  end
end

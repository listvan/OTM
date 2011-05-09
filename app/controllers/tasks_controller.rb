class TasksController < ApplicationController
  respond_to :html

  def index
    @tasks = Task.all
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
      flash[:notice] = t('models.task.created_successfully')
      redirect_to(tasks_path)
    end
  rescue ActiveRecord::RecordInvalid
    flash[:error] = t('models.task.create_failed')
    render :action => :new, :status => :not_acceptable
  end
end

class DependenciesController < ApplicationController                                                                                                                                                 
  def index
    @tasks = Task.all
  end

  def show 
    @dependency = Dependency.find(params[:id])
  end      

  def create
    @object   = Task.find(params[:id])
    @subject  = Task.find(params[:dependency][:subject]) unless params[:dependency][:subject].blank?
    @obj      = Task.find(params[:dependency][:object]) unless params[:dependency][:object].blank?
    
    Dependency.transaction do
      Dependency.create(:object => @object, :subject => @subject) if @subject
      Dependency.create(:object => @obj, :subject => @object) if @obj

    end
    redirect_to edit_task_path(@object)
  end

  def destroy
    @dependency = Dependency.find(params[:id])
    if params[:type] == 'incoming'
      @task = @dependency.subject
    elsif params[:type] == 'outgoing'
      @task = @dependency.object
    end
    @dependency.destroy
    redirect_to edit_task_path(@task)

  end
end

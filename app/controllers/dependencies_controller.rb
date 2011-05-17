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
    flash[:notice] = 'models.dependency.created_successfully'
    redirect_to edit_task_path(@object)

  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'models.dependency.create_failed'
    render :action => :new, :status => :not_acceptable

  end

  def destroy
    @dependency = Dependency.find(params[:id])
    if params[:type] == 'incoming'
      @task = @dependency.subject
    elsif params[:type] == 'outgoing'
      @task = @dependency.object
    end
    @dependency.destroy
    flash[:notice] = 'models.dependency.deleted_successfully'
    redirect_to edit_task_path(@task)

  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'models.dependency.deleted_failed'
    redirect_to edit_task_path(@task)
  end
end

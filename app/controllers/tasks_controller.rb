class TasksController < ApplicationController
  respond_to :html

  def index
    @tasks = Task.scoped
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    @precedings = Array.new
    @followings = Array.new
    @finished_processes = Array.new
    @running_process = Task::Process.find(:first, :conditions => {:finished_at => nil})
    @running = false 
    @task.processes.each do |pro|
      if pro.finished_at.blank?
        @running = true
      else
        @finished_processes << pro
      end
    end
    @task.incoming_dependencies.each do |i|
      @precedings << i.object
    end
    
    @task.outgoing_dependencies.each do |o|
      @followings << o.subject
    end

    respond_with(@task)
  end

  def create
    child_id = params[:task].delete('children')
    @task = Task.new(params[:task])
    @child = Task.find(child_id.to_i) if child_id
    Task.transaction do
      @task.save!
      @child.update_attribute(:parent_id, @taks.id) if @child
    end
      flash[:notice] = 'models.task.created_successfully'
      redirect_to(root_path)
  
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'models.task.create_failed'
    render :action => :new, :status => :not_acceptable
  end

  def edit
    @task = Task.find(params[:id])                                                                                                                                                             
    @valid_children = Task.order(:title)-@task.children-[@task]
    @depend_by = Array.new
    @depend_on = Array.new
    
    @task.incoming_dependencies.each do |i|
      @depend_by << Task.find(i.object.id)
    end 
    @task.outgoing_dependencies.each do |i|
      @depend_on << Task.find(i.subject_id)
    end
    
    @valid_deps = Task.order(:title)-@depend_by-@depend_on
  end
  
  def update
    child_id = params[:task].delete('children')
    @task = Task.find(params[:id])                                                                                                                                                              
    @child = Task.find(child_id.to_i) if child_id

    Task.transaction do
      @task.update_attributes!(params[:task])
      @child.update_attribute(:parent_id, @task.id) if @child
    end
    if @child
      flash.now[:notice] = 'models.task.child.create_success'
      redirect_to edit_task_path(@task)
    else
      flash.now[:notice] = 'models.task.update_success'
      redirect_to(task_path)
    end
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'models.task.create_failed'
    render :action => :edit, :status => :not_acceptable

  end

  def delete_child
    @task = Task.find(params[:id])
    @parent = @task.parent
    Task.transaction do
      @task.update_attribute(:parent_id, nil)
    end
    flash.now[:notice] = 'models.task.child_delete_success'   
    redirect_to edit_task_path(@parent)

  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash.now[:notice] = 'models.task.delete_success'   
    redirect_to root_path
  end

end

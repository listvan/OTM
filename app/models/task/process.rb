class Task::Process < ActiveRecord::Base
  set_table_name 'task_processes'    
  
  belongs_to :task, :class_name => 'Task', :foreign_key => :task_id

  validates :description, :length => { :maximum => 2.kilobytes }
end

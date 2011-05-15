class Dependency < ActiveRecord::Base
  belongs_to :object, :class_name => 'Task'
  belongs_to :subject, :class_name => 'Task'

  validates :object_id, :presence => true
  validates :object, :associated => true
  validates :subject_id, :presence => true
  validates :subject, :associated => true   


end

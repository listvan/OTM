class Task < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Task', :foreign_key => :parent_id
  has_many   :children, :class_name => 'Task', :foreign_key => :parent_id

  validates :title, :presence => true, :length => { :in => 3..250 }
  validates :description, :length => { :maximum => 2.kilobytes }
  validates :priority, :numericality => { :only_integer => true }, :presence => true
end

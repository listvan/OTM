# encoding: utf-8
class Task < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Task', :foreign_key => :parent_id
  has_many   :children, :class_name => 'Task', :foreign_key => :parent_id

  has_many :processes, :class_name => 'Task::Process', :foreign_key => :task_id

  has_many :outgoing_dependencies,                                                                                                                                                                   
    :dependent => :destroy,
    :class_name => 'Dependency',
    :inverse_of => :object,
    :foreign_key => :object_id
  has_many :incoming_dependencies,
    :dependent => :destroy,
    :class_name => 'Dependency',
    :inverse_of => :subject,
    :foreign_key => :subject_id




  validates :title, :presence => true, :length => { :in => 3..250 }
  validates :description, :length => { :maximum => 2.kilobytes }
  validates :priority, :numericality => { :only_integer => true }, :presence => true

  def to_s
    %{#{title.truncate(20, :omission => '…')} (#{priority})}
  end
require_dependency File.expand_path('../task/process.rb', __FILE__)
end

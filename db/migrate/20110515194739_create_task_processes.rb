class CreateTaskProcesses < ActiveRecord::Migration
  def self.up
    create_table :task_processes do |t|
      t.integer  :task_id
      t.text     :description, :limit => 2.kilobytes
      t.datetime :started_at
      t.datetime :finished_at
  
      t.timestamps
    end
  end

  def self.down
    drop_table :task_processes
  end
end

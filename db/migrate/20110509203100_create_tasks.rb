class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer  :parent_id
      t.string   :title, :null => false, :default => '', :limit => 250
      t.text     :description, :limit => 2.kilobytes
      t.integer  :priority, :null => false, :default => 0
      t.datetime :due_at
      t.datetime :created_at
      t.datetime :updated_at
    end

    change_table :tasks do |t|
      t.index    :parent_id
      t.index    :title
      t.index    :priority
    end
  end

  def self.down
    drop_table :tasks
  end
end

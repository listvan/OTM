class CreateDependencies < ActiveRecord::Migration
  def self.up
    create_table :dependencies do |t|
      t.integer :object_id
      t.integer :subject_id
      t.timestamps
    end
  end

  def self.down
    drop_table :dependencies
  end
end

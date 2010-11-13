class CreateWalls < ActiveRecord::Migration
  def self.up
    create_table :walls do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.timestamps
    end
    add_index :walls, [:slug], :unique => true

    create_table :moderators do |t|
      t.integer :wall_id
      t.integer :user_id
      t.timestamps
    end
    add_index :moderators, [:wall_id, :user_id], :unique => true

    add_column :statuses, :wall_id, :integer
    add_index :statuses, :wall_id
  end

  def self.down
    remove_column :statuses, :wall_id
    drop_table :moderators
    drop_table :walls
  end
end
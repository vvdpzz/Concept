class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :user
      t.integer :photoable_id, :default => 0
      t.string :photoable_type

      t.timestamps
    end
    add_index :photos, :user_id
    add_index :photos, :photoable_id
    add_index :photos, :photoable_type
  end

  def self.down
    drop_table :photos
  end
end

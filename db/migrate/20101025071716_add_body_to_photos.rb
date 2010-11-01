class AddBodyToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :body, :text
  end

  def self.down
    remove_column :photos, :body
  end
end

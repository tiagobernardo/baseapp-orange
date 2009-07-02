class AddGalleryId < ActiveRecord::Migration
  def self.up
    add_column :images, :gallery_id, :integer
  end

  def self.down
    remove_column :images, :gallery_id
  end
end

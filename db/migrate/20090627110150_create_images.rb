class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string   "name"
      t.string   "permalink"
      t.text     "description"
      t.integer  "image_file_size"
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.datetime "image_updated_at"
      t.string   "state"
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end

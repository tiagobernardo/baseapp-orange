class CleanUpImagesThemes < ActiveRecord::Migration
  def self.up
    remove_column :contents, :body
    remove_column :contents, :language
    add_column :themes, :controller, :string 
    
    drop_table :images
    drop_table :galleries
  end

  def self.down
    create_table "galleries", :force => true do |t|
      t.string   "permalink"
      t.string   "state"
      t.string   "language"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "name_pt"
      t.string   "name_en"
      t.text     "body_pt"
      t.text     "body_en"
    end
    
    create_table "images", :force => true do |t|
      t.string   "name"
      t.string   "permalink"
      t.text     "description"
      t.integer  "image_file_size"
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.datetime "image_updated_at"
      t.string   "state"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "gallery_id"
    end
    
    remove_column :themes, :controller
    add_column :contents, :language, :string
    add_column :contents, :body, :text
  end
end

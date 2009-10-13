class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.string   "name"
      t.string   "permalink"
      t.text     "description"
      t.string   "state"
      t.string   "language"
      t.timestamps
    end
    add_column :pages, :theme_id, :integer

    #for mysql
    #add_index :pages, :theme_id

  end

  def self.down
    remove_index :pages, :theme_id
    remove_column :pages, :theme_id
    drop_table :themes
  end
end

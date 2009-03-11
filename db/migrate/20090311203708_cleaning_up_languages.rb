class CleaningUpLanguages < ActiveRecord::Migration
  def self.up
    #we dont need languages table I guess.
    #it's redundant
    #configure your languages in environment.rb and dont forget to add the apropriate locale
    drop_table :languages
    remove_column :news, :language_id
    remove_column :pages, :language_id 
    remove_column :contents, :language_id 
    add_column :news, :language, :string
    add_column :pages, :language, :string
    add_column :contents, :language, :string
  end

  def self.down
    remove_index :news, :permalink
    remove_column :contents, :language
    remove_column :pages, :language
    remove_column :news, :language
    add_column :news, :language_id, :integer
    add_column :pages, :language_id, :integer
    add_column :contents, :language_id, :integer
    create_table :languages do |t|
       t.string :name
       t.string :permalink
       t.text :description
       t.timestamps
    end
  end
end

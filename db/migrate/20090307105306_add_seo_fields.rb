class AddSeoFields < ActiveRecord::Migration
  def self.up
    add_column :news, :meta_description, :text
    add_column :news, :meta_keywords, :text
    
    add_column :pages, :meta_description, :text
    add_column :pages, :meta_keywords, :text
  end

  def self.down
    remove_column :pages, :meta_keywords
    remove_column :pages, :meta_description
    remove_column :news, :meta_keywords
    remove_column :news, :meta_description
  end
end

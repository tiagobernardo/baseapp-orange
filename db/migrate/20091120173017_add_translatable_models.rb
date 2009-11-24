class AddTranslatableModels < ActiveRecord::Migration
  def self.up
    #gallery
    add_column :galleries, :name_pt, :string
    add_column :galleries, :name_en, :string
    add_column :galleries, :body_pt, :text
    add_column :galleries, :body_en, :text
    remove_column :galleries, :description
    remove_column :galleries, :name
    
    #contents
    add_column :contents, :name_pt, :string
    add_column :contents, :name_en, :string
    add_column :contents, :body_pt, :text
    add_column :contents, :body_en, :text
    remove_column :contents, :description
    remove_column :contents, :name
    
    #news
    add_column :news, :name_pt, :string
    add_column :news, :name_en, :string
    add_column :news, :body_pt, :text
    add_column :news, :body_en, :text
    add_column :news, :lead_pt, :string
    add_column :news, :lead_en, :string
    remove_column :news, :body
    remove_column :news, :name
    remove_column :news, :lead
    remove_column :news, :language

    #pages
    add_column :pages, :name_pt, :string
    add_column :pages, :name_en, :string
    add_column :pages, :body_pt, :text
    add_column :pages, :body_en, :text
    remove_column :pages, :body
    remove_column :pages, :name
    remove_column :pages, :language
    
  end

  def self.down
    remove_column :pages, :body_pt
    remove_column :pages, :body_en
    remove_column :pages, :name_en
    remove_column :pages, :name_pt 
    add_column :pages, :body, :text
    add_column :pages, :name, :string 
    
    remove_column :news, :body_pt
    remove_column :news, :body_en
    remove_column :news, :name_en
    remove_column :news, :name_pt
    remove_column :news, :lead_pt
    remove_column :news, :lead_en
    add_column :news, :body, :text
    add_column :news, :name, :string
    add_column :news, :lead, :string

    
    remove_column :galleries, :body_pt
    remove_column :galleries, :body_en
    remove_column :galleries, :name_en
    remove_column :galleries, :name_pt
    add_column :galleries, :description, :text
    add_column :galleries, :name, :string
    
    remove_column :contents, :body_pt
    remove_column :contents, :body_en
    remove_column :contents, :name_en
    remove_column :contents, :name_pt
    add_column :contents, :description, :text
    add_column :contents, :name, :string
  end
end

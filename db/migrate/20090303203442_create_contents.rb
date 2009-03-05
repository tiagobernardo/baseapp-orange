class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :name
      t.string :permalink
      t.text :body
      t.string :state
      t.integer :language_id
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end

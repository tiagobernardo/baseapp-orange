class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :permalink
      t.text :body
      t.text :lead
      t.string :state
      t.integer  :position
      t.datetime :date
      t.integer :language_id
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

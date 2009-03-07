class EventsArentStriclyNeeded < ActiveRecord::Migration
  def self.up
    #we dont need this, most projects dont need this.
    drop_table :events
  end

  def self.down
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
end

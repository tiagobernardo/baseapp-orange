class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string   "name"
      t.string   "permalink"
      t.text     "description"
      t.string   "state"
      t.string   "language"
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end

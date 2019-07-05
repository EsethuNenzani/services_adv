class CreateRefineryItems < ActiveRecord::Migration[5.1]
  def self.up
    create_table :refinery_items do |t|
      t.integer :image_id
      t.integer :gallery_id

      t.timestamps
    end

    add_index :refinery_items, :image_id
    add_index :refinery_items, :gallery_id
  end

  def self.down
    drop_table :refinery_items
  end
end

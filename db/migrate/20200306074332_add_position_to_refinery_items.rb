class AddPositionToRefineryItems < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_items, :position, :integer
  end
end

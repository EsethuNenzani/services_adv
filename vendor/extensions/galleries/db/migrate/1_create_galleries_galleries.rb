class CreateGalleriesGalleries < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_galleries do |t|
      t.string :name
      t.string :slug
      t.boolean :is_active
      t.integer :position

      t.timestamps
    end

    add_index :refinery_galleries, :slug
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-galleries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/galleries/galleries"})
    end

    drop_table :refinery_galleries

  end

end

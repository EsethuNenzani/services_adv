# This migration comes from refinery_banners (originally 1)
class CreateBannersBanners < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_banners do |t|
      t.string :name
      t.string :title
      t.text :description
      t.integer :image_id
      t.string :url
      t.boolean :is_active
      t.date :start_date
      t.date :expiry_date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-banners"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/banners/banners"})
    end

    drop_table :refinery_banners

  end

end

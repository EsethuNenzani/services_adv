# This migration comes from refinery_pods (originally 1)
class CreatePodsPods < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pods do |t|
      t.string :name
      t.text :body
      t.string :url
      t.integer :image_id
      t.string :pod_type
      t.integer :gallery_id
      t.string :video_url
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pods"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pods/pods"})
    end

    drop_table :refinery_pods

  end

end

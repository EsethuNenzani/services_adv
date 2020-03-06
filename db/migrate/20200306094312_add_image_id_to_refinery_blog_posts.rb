class AddImageIdToRefineryBlogPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_blog_posts, :image_id, :integer
  end
end

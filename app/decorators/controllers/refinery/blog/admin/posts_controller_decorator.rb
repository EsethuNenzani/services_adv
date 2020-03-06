Refinery::Blog::Admin::PostsController.class_eval do

	private

	def post_params
		params.require(:post).permit(permitted_post_params)
	end

	def permitted_post_params
		[
				:title, :body, :custom_teaser, :tag_list,
				:draft, :published_at, :custom_url, :user_id, :username, :browser_title,
				:meta_description, :source_url, :source_url_title, :image_id, :category_ids => []
		]
	end


end
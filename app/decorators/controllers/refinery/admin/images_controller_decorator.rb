Refinery::Admin::ImagesController.class_eval do


	def permitted_image_params
		[
				:image, :image_mime_type, :image_name, :image_size, :image_width, :image_height,
				:image_uid, :image_title, :image_alt
		]
	end

end
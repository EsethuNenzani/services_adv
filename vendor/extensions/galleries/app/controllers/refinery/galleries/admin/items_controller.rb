module Refinery
  module Galleries
    module Admin
      class ItemsController < ::Refinery::AdminController

        def get_presigned_url
          prefix= "#{DateTime.now.strftime('%Y/%m/%d/%H/%M/%S/')}#{SecureRandom.uuid}/"
          full_path = "#{prefix}#{params[:name]}"
          presigned_url = Aws::S3Provider.signed_request(prefix, params[:name], params[:file_type])

          respond_to do |format|
            format.json {render json: {presigned_url: "#{presigned_url}", image_uid: full_path, image_name: params[:name],
                                       image_mime_type: params[:file_type]  }
            }
          end
        end

        def add_item_to_gallery

          image = Refinery::Image.new
          image.image_name = params[:image_name]
          image.image_uid = params[:image_uid]
          image.image_mime_type = params[:image_mime_type]
          image.image_size = params[:image_size]
          image.image_height = params[:image_height]
          image.image_width = params[:image_width]
          image.image_title = params[:image_name].split('.')[0]
          image.image_alt = params[:image_name].split('.')[0]
          image.save(validate: false)

          gallery = Refinery::Galleries::Gallery.friendly.find(params[:gallery_id])

          gallery.images << image

          respond_to do |format|
            format.js {}
          end
        end

      end
    end
  end
end

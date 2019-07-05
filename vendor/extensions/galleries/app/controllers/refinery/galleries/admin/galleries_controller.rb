module Refinery
  module Galleries
    module Admin
      class GalleriesController < ::Refinery::AdminController

        crudify :'refinery/galleries/gallery',
                :title_attribute => 'name'

        def new
          @gallery = Gallery.new
          # 1.times { @gallery.items.build }
        end

        def edit
          @gallery = Gallery.friendly.find(params[:id])
          # 5.times { @gallery.items.build }
        end

        private

        # Only allow a trusted parameter "white list" through.
        def gallery_params
          params.require(:gallery).permit(:name, :slug, :is_active, items_attributes: [:id, :image_id, :gallery_id, :_destroy])
        end
      end
    end
  end
end

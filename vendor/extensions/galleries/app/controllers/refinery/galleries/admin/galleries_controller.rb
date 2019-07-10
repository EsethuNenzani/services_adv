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

        def show_add_image_panel
          @gallery = Gallery.friendly.find params[:gallery_id]
          @images = Refinery::Image.where.not(id: @gallery.items.present? ? @gallery.items.map{|m| m.image_id} : [] )
        end

        def add_items
          @images = Refinery::Image.where(id: params[:image_ids])
          @gallery = Gallery.friendly.find params[:gallery_id]

          @gallery.images << @images
        end

        def remove_item
          @gallery = Gallery.friendly.find params[:gallery_id]
          item = Refinery::Galleries::Item.find params[:item_id]
          @gallery.items.delete(item)

          respond_to do |format|
            format.html {}
            format.js {}
          end
        end

        private

        # Only allow a trusted parameter "white list" through.
        def gallery_params
          params.require(:gallery).permit(:name, :slug, :is_active, item_ids:[])
        end
      end
    end
  end
end

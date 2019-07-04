module Refinery
  module Galleries
    module Admin
      class GalleriesController < ::Refinery::AdminController

        crudify :'refinery/galleries/gallery',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def gallery_params
          params.require(:gallery).permit(:name, :slug, :is_active)
        end
      end
    end
  end
end

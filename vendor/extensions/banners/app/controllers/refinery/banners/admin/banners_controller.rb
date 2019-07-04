module Refinery
  module Banners
    module Admin
      class BannersController < ::Refinery::AdminController

        crudify :'refinery/banners/banner',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def banner_params
          params.require(:banner).permit(:name, :title, :description, :image_id, :url, :is_active, :start_date, :expiry_date, page_ids:[])
        end
      end
    end
  end
end

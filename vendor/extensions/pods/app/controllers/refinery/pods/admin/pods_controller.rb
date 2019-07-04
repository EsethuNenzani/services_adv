module Refinery
  module Pods
    module Admin
      class PodsController < ::Refinery::AdminController

        crudify :'refinery/pods/pod',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def pod_params
          params.require(:pod).permit(:name, :body, :url, :image_id, :pod_type, :gallery_id, :video_url, page_ids:[])
        end
      end
    end
  end
end

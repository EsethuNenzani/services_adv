module Refinery
  module Galleries
    class GalleriesController < ::ApplicationController

      before_action :find_all_galleries
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gallery in the line below:
        present(@page)
      end

      def show
        @gallery = Gallery.friendly.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gallery in the line below:
        present(@page)
      end

    protected

      def find_all_galleries
        @galleries = Gallery.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/galleries").first
      end

    end
  end
end

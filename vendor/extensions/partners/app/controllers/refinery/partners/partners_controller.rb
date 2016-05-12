module Refinery
  module Partners
    class PartnersController < ::ApplicationController

      before_filter :find_all_partners
      before_filter :find_page
      before_filter :viewable_index, only: [:index]
      before_filter :viewable_object, only: [:show]

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @partner in the line below:
        present(@page)
      end

      def show
        @partner = Partner.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @partner in the line below:
        present(@page)
      end

    protected

      def find_all_partners
        @partners = Partner.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/partners").first
      end

    end
  end
end

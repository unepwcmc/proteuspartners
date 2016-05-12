module Refinery
  module Documents
    class CategoriesController < ::ApplicationController

      before_filter :find_all_categories
      before_filter :sub_categories, only: [:show]

      prepend_before_filter :find_page
      prepend_before_filter :find_category, only: [:show]

      def show
        present(@page)
        

        @category_documents = @category.documents.order('title ASC')

        @page = Refinery::Page.new(draft: false)
      end

    protected

      def find_all_categories
        @categories = Category.order('position ASC')
      end

      def find_category
        @category = Category.find(params[:id])
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/categories").first
      end

      def sub_categories
        @sub_categories = Refinery::Documents::Category.where("depth > 0 AND parent_id = #{@category.id}").order('lft ASC')
      end


      

    end
  end
end

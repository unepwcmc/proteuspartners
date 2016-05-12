module Refinery
  module Tools
    class ToolsController < ::ApplicationController

      before_filter :find_all_tools
      prepend_before_filter :find_tool, only: [:show]
      prepend_before_filter :find_page

      def show

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tool in the line below:
        present(@page)
      end

    protected

      def find_tool
        @tool = Tool.find(params[:id])
      end

      def find_all_tools
        @tools = Tool.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/tools").first
      end

    end
  end
end

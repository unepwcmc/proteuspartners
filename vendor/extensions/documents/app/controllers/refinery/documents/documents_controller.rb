module Refinery
  module Documents
    class DocumentsController < ::ApplicationController

      before_filter :find_all_documents
      before_filter :find_document, only: [:show]
      prepend_before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @document in the line below:
        present(@page)
        @updated = Document.recent_updated(5)
        
        @per_page = params[:per_page] || Refinery::Documents::Document.per_page || 10
        @documents_search = Refinery::Documents::Document.search(params[:search], :page => params[:page], per_page: @per_page)
        @total_records = @documents_search.total_entries
        @searched_item = params["search"]

        @page = Refinery::Page.new(draft: false)
      end

      def show

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @document in the line below:
        present(@page)

        respond_to do |format|
          format.html
          format.pdf { 
            send_file @document.document.file.path, type: "application/pdf", disposition: 'inline'
          }
        end
      end

    protected

      def find_document
        @document = Document.find(params[:id])
      end

      def find_all_documents
        @per_page = params[:per_page] || Refinery::Documents::Document.per_page || 10
        @documents = Document.order('key_resource_int DESC, updated_at DESC').paginate(per_page: @per_page, :page => params[:page])
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/resources").first
      end

    end
  end
end

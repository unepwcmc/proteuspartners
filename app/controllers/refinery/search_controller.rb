module Refinery
  class SearchController < ::ApplicationController

    def index
      @documents = Refinery::Documents::Document.search(params[:search], :page => params[:page], :per_page => 10)
      @total_records = @documents.total_entries
      @categories = Refinery::Documents::Category.where("depth = 0").limit(6)
      @searched_item = params["search"]
    end

  end
end
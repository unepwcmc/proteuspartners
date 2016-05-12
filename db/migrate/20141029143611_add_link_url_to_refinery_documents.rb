class AddLinkUrlToRefineryDocuments < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :link_url, :string
  end
end

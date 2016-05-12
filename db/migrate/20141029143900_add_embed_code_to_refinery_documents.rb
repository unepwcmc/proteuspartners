class AddEmbedCodeToRefineryDocuments < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :embed_code, :text
  end
end

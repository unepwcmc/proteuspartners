class AddCategoryDocumentCountToRefineryDocuments < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :category_document_count, :integer, :default => 0
    add_index :refinery_documents, :category_document_count
  end
end

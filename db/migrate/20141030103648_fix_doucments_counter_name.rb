class FixDoucmentsCounterName < ActiveRecord::Migration
  def change
    rename_column :refinery_documents, :category_document_count, :documents_count
  end
end

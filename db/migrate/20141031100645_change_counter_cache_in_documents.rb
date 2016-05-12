class ChangeCounterCacheInDocuments < ActiveRecord::Migration
  def change
    rename_column :refinery_documents, :documents_count, :category_count
  end
end

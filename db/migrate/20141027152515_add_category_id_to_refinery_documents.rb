class AddCategoryIdToRefineryDocuments < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :category_id, :integer
    add_index :refinery_documents, :category_id
  end
end

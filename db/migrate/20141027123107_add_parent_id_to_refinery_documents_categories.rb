class AddParentIdToRefineryDocumentsCategories < ActiveRecord::Migration
  def change
    add_column :refinery_documents_categories, :parent_id, :integer
    add_index :refinery_documents_categories, :parent_id
  end
end

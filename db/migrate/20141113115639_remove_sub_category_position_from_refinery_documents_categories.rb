class RemoveSubCategoryPositionFromRefineryDocumentsCategories < ActiveRecord::Migration
  def change
    remove_column :refinery_documents_categories, :sub_category_position
  end
end

class AddSubCategoryPositionToRefineryDocumentsCategories < ActiveRecord::Migration
  def change
    add_column :refinery_documents_categories, :sub_category_position, :integer
  end
end

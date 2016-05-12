class AddDescriptionToRefineryDocumentsCategories < ActiveRecord::Migration
  def change
    add_column :refinery_documents_categories, :description, :text
  end
end

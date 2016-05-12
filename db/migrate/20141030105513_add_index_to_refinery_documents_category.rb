class AddIndexToRefineryDocumentsCategory < ActiveRecord::Migration
  def change
    add_index :refinery_documents_categories, :image_id
  end
end

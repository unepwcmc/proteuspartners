class AddImageIdToRefineryDocumentsCategory < ActiveRecord::Migration
  def change
    add_column :refinery_documents_categories, :image_id, :integer
  end
end

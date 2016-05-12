class AddIndexToRefineryDocumentsCategoris < ActiveRecord::Migration
  def change
    add_index :refinery_documents_categories, :rgt
    add_index :refinery_documents_categories, :lft
    add_index :refinery_documents_categories, :depth
  end
end

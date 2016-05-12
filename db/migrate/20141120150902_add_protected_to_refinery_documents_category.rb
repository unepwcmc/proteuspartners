class AddProtectedToRefineryDocumentsCategory < ActiveRecord::Migration
  def change
    add_column :refinery_documents_categories, :protected, :boolean, :default => true
  end
end

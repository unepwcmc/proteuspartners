class AddProtectedToRefineryDocuments < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :protected, :boolean, :default => true
  end
end

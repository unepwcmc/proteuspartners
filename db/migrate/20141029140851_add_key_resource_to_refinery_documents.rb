class AddKeyResourceToRefineryDocuments < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :key_resource, :boolean
  end
end

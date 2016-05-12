class AddKeyResourceIntToRefineryDocuments < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :key_resource_int, :integer
  end
end

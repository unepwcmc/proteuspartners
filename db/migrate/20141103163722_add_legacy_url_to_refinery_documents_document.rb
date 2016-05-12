class AddLegacyUrlToRefineryDocumentsDocument < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :legacy_url, :string
  end
end

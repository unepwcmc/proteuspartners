class AddSlugToRefineryDocumentsDocument < ActiveRecord::Migration
  def change
    add_column :refinery_documents, :slug, :string
  end
end

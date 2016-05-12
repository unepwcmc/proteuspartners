class CreateRefineryCategoriesDocuments < ActiveRecord::Migration
  def change
    create_table :refinery_categories_documents do |t|
      t.integer :category_id
      t.integer :document_id

      t.timestamps
    end
  end
end

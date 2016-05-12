ThinkingSphinx::Index.define 'refinery/documents/document', :with => :active_record do

  # where "category_document_count > 0"
  # fields
  indexes :title

  # attributes
  has categories(:id), as: :category_ids
end
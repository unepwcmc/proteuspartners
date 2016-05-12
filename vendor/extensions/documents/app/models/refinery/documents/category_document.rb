module Refinery
  module Documents
    class CategoryDocument < Refinery::Core::BaseModel
      self.table_name = 'refinery_categories_documents'

      attr_accessible :category_id, :document_id

      belongs_to :category, :class_name => '::Refinery::Documents::Category'
      belongs_to :document, :class_name => '::Refinery::Documents::Document', counter_cache: :category_count
    end
  end
end
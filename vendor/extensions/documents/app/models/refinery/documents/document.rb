module Refinery
  module Documents
    class Document < Refinery::Core::BaseModel
      include ThinkingSphinx::Scopes

      before_save :set_key_resource_int
      after_save :reset_category_count

      self.table_name = 'refinery_documents'

      attr_accessor :title, :description, :document_id, :position, :category_ids, :protected, :key_resource, :link_url, :embed_code, :category_count

      validates :title, :presence => true, :uniqueness => true

      belongs_to :document, :class_name => '::Refinery::Resource'

      has_many :categories_documents, class_name: '::Refinery::Documents::CategoryDocument', foreign_key: :document_id, dependent: :destroy
      has_many :categories, class_name: '::Refinery::Documents::Category', through: :categories_documents

      sphinx_scope(:categorised) {
        {:where => 'category_count > 0'}
      }

      #acts_as_indexed :fields => [:title]

      extend FriendlyId
      friendly_id :title, use: [:slugged, :history]

      self.per_page = 10

      def self.recent_updated(limit)
        order('key_resource_int DESC, updated_at DESC').limit(limit)
      end

      def self.categorised
        where("category_count > 0")
      end

      private

      def set_key_resource_int
        self.key_resource_int = key_resource?? 1 : 0
        true
      end
      
      def reset_category_count
        self.class.reset_counters(self.id, :categories_documents)
      end

    end
  end
end

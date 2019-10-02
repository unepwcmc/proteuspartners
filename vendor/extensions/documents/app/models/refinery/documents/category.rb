module Refinery
  module Documents
    class Category < Refinery::Core::BaseModel

      attr_accessor :title, :position, :parent_id, :image_id, :sub_category_position, :description, :protected

      has_many :categories_documents, class_name: '::Refinery::Documents::CategoryDocument', foreign_key: :category_id, dependent: :destroy
      has_many :documents, class_name: '::Refinery::Documents::Document', through: :categories_documents

      belongs_to :image

      validates :title, :presence => true, :uniqueness => true

      acts_as_nested_set

      #acts_as_indexed :fields => [:title]

      extend FriendlyId
      friendly_id :title, use: [:slugged, :history]

      class << self

        def children_of(parent_id)
          where(parent_id: parent_id).order(:lft)
        end

      end

    end
  end
end

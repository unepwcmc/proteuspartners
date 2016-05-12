module Refinery
  module Tools
    class Tool < Refinery::Core::BaseModel
      self.table_name = 'refinery_tools'

      attr_accessible :title, :header_image_id, :screen_shot_image_id, :tool_url, :download_description, :short_description, :long_description, :position, :wdpa_link, :protected, :show_wdpa, :homepage_image_id, :download_footer

      belongs_to :header_image, :class_name => '::Refinery::Image'
      belongs_to :screen_shot_image, :class_name => '::Refinery::Image'
      belongs_to :homepage_image, :class_name => '::Refinery::Image'

      validates :title, :presence => true, :uniqueness => true

      extend FriendlyId
      friendly_id :title, use: [:slugged, :history]
      
    end
  end
end

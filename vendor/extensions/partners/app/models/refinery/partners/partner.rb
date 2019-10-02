module Refinery
  module Partners
    class Partner < Refinery::Core::BaseModel
      self.table_name = 'refinery_partners'

      devise :database_authenticatable, :registerable, authentication_keys: [:username]

      attr_accessor :icon_image_id, :title, :url, :position, :username, :password, :password_confirmation, :show_in_footer, :large_logo, :smal_logo

      belongs_to :icon_image, :class_name => '::Refinery::Image'

      validates :password, :password_confirmation, presence: true, on: :create
    end
  end
end

class AddHomePageImageToRefineryTools < ActiveRecord::Migration
  def change
    add_column :refinery_tools, :homepage_image_id, :integer
  end
end

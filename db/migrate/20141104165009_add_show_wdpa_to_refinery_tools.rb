class AddShowWdpaToRefineryTools < ActiveRecord::Migration
  def change
    add_column :refinery_tools, :show_wdpa, :boolean
  end
end

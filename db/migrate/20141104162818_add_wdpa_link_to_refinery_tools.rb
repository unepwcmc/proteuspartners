class AddWdpaLinkToRefineryTools < ActiveRecord::Migration
  def change
    add_column :refinery_tools, :wdpa_link, :string
  end
end

class ChangeDescriptionsInTools < ActiveRecord::Migration
  def change
    rename_column :refinery_tools, :description, :short_description
    rename_column :refinery_tools, :what_tools_description, :long_description
    rename_column :refinery_tools, :download_data_set, :download_description
  end
end

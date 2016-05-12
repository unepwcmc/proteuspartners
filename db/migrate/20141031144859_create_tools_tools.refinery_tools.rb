# This migration comes from refinery_tools (originally 1)
class CreateToolsTools < ActiveRecord::Migration

  def up
    create_table :refinery_tools do |t|
      t.string :title
      t.integer :header_image_id
      t.integer :screen_shot_image_id
      t.string :tool_url
      t.text :download_data_set
      t.text :description
      t.text :what_tools_description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tools"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tools/tools"})
    end

    drop_table :refinery_tools

  end

end

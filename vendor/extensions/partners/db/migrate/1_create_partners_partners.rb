class CreatePartnersPartners < ActiveRecord::Migration

  def up
    create_table :refinery_partners do |t|
      t.integer :icon_image_id
      t.string :title
      t.string :url
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-partners"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/partners/partners"})
    end

    drop_table :refinery_partners

  end

end

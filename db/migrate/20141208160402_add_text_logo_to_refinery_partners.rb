class AddTextLogoToRefineryPartners < ActiveRecord::Migration
  def change
    add_column :refinery_partners, :text_logo, :boolean
  end
end

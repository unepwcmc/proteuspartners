class AddSmallLogoToRefineryPartners < ActiveRecord::Migration
  def change
    add_column :refinery_partners, :smal_logo, :boolean
  end
end

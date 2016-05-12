class ChangeTextLogoToLargeLogo < ActiveRecord::Migration
  def change
    rename_column :refinery_partners, :text_logo, :large_logo
  end
end

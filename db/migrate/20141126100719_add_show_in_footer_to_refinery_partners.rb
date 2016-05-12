class AddShowInFooterToRefineryPartners < ActiveRecord::Migration
  def change
    add_column :refinery_partners, :show_in_footer, :boolean, default: true
  end
end

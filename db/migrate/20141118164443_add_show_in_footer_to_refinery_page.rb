class AddShowInFooterToRefineryPage < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :show_in_footer, :bool
  end
end

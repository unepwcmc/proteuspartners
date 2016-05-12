class AddDownloadFooterToRefineryTools < ActiveRecord::Migration
  def change
    add_column :refinery_tools, :download_footer, :string
  end
end

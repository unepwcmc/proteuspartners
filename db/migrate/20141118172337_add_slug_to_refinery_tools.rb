class AddSlugToRefineryTools < ActiveRecord::Migration
  def change
    add_column :refinery_tools, :slug, :string
  end
end

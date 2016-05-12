class AddProtectedToRefineryTools < ActiveRecord::Migration
  def change
    add_column :refinery_tools, :protected, :boolean, :default => true
  end
end

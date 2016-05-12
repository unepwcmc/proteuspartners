class AddProtectedToRefineryPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :protected, :boolean, :default => true
  end
end

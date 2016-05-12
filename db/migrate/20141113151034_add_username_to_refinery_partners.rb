class AddUsernameToRefineryPartners < ActiveRecord::Migration
  def change
    add_column :refinery_partners, :username, :string
  end
end

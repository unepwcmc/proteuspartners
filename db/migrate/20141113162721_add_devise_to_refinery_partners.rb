class AddDeviseToRefineryPartners < ActiveRecord::Migration
  def self.up
    change_table(:refinery_partners) do |t|
      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    add_index :refinery_partners, :reset_password_token, :unique => true
    # add_index :refinery_partners, :confirmation_token,   :unique => true
    # add_index :refinery_partners, :unlock_token,         :unique => true
    # add_index :refinery_partners, :authentication_token, :unique => true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration

      remove_column :refinery_partners,  :encrypted_password
      remove_column :refinery_partners, :reset_password_token
      remove_column :refinery_partners, :reset_password_sent_at
      remove_column :refinery_partners, :remember_created_at
      remove_column :refinery_partners, :sign_in_count
      remove_column :refinery_partners, :current_sign_in_at
      remove_column :refinery_partners, :last_sign_in_at
      remove_column :refinery_partners, :current_sign_in_ip
      remove_column :refinery_partners, :last_sign_in_ip
  end
end

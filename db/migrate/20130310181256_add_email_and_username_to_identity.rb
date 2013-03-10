class AddEmailAndUsernameToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :email, :string
    add_column :identities, :username, :string
  end
end

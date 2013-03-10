class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string  :provider,              null: false
      t.string  :uid,                   null: false
      t.text    :omniauth_info
      t.text    :omniauth_credentials
      t.text    :omniauth_extra
      t.string  :type

      t.timestamps
    end

    add_index :identities, :user_id
    add_index :identities, [:provider, :uid], unique: true
  end
end

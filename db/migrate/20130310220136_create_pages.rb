class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :tagline
      t.text :description
      t.string :main_image
      t.string :template_id
      t.integer :owner_id

      t.timestamps
    end
  end
end

class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :class_name
      t.text :description
      t.integer :created_by_id

      t.timestamps
    end
  end
end

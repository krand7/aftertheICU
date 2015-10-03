class CreateContentGroups < ActiveRecord::Migration
  def change
    create_table :content_groups do |t|
      t.string :title
      t.string :slug
      t.integer :position
      t.text :description
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end
  end
end

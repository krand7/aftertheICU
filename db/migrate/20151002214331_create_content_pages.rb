class CreateContentPages < ActiveRecord::Migration
  def change
    create_table :content_pages do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.integer :position
      t.string :photo
      t.integer :content_group_id
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end
  end
end

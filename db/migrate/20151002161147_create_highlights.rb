class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :title
      t.string :description
      t.string :photo
      t.date :display_date
      t.string :link
      t.boolean :deleted, default: false, null: false
      t.boolean :displayed, default: true, null: false

      t.timestamps null: false
    end
  end
end

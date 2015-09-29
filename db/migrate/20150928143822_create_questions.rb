class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.string :display_type
      t.string :slug
      t.integer :user_id
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end

    add_index :questions, :slug
    add_index :questions, :user_id
  end
end

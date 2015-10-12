class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :description
      t.string :status
      t.string :slug
      t.integer :user_id
      t.boolean :deleted, default: false, null: false
      t.boolean :pediatric, default: false, null: false
      t.integer :child_min_age
      t.integer :child_max_age

      t.timestamps null: false
    end

    add_index :surveys, :slug
    add_index :surveys, :user_id
  end
end

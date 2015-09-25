class CreateResearchTopics < ActiveRecord::Migration
  def change
    create_table :research_topics do |t|
      t.integer :user_id
      t.string :name
      t.string :slug
      t.string :description
      t.boolean :deleted, default: false, null: false
      t.string :progress, default: "under_review", null: false

      t.timestamps null: false
    end

    add_index :research_topics, :user_id
    add_index :research_topics, :slug, unique: true
  end
end

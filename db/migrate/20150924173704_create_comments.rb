class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :research_topic_id
      t.text :description
      t.boolean :deleted, default: false, null: false
      t.string :status, default: "pending_review"
      t.integer :deleted_by_id
      t.integer :last_moderated_by_id
      t.datetime :last_moderated_at

      t.timestamps null: false
    end

    add_index :comments, :user_id
    add_index :comments, :research_topic_id
  end
end

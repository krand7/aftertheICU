class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer  :topic_id
      t.text     :description
      t.integer  :user_id
      t.string   :status,               default: "pending_review"
      t.integer  :last_moderated_by_id
      t.datetime :last_moderated_at
      t.boolean  :deleted,              default: false,            null: false
      t.boolean  :links_enabled,        default: false,            null: false
      t.integer  :deleted_by_id

      t.timestamps null: false
    end

    add_index :posts, :topic_id
    add_index :posts, :user_id
    add_index :posts, :last_moderated_by_id
  end
end

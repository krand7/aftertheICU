class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer  :forum_id
      t.integer  :user_id
      t.string   :name
      t.boolean  :locked,       default: false,            null: false
      t.boolean  :pinned,       default: false,            null: false
      t.boolean  :deleted,      default: false,            null: false
      t.datetime :last_post_at
      t.string   :status,       default: "pending_review"
      t.integer  :views_count,  default: 0,                null: false
      t.string   :slug

      t.timestamps null: false
    end

    add_index :topics, :forum_id
    add_index :topics, :user_id
    add_index :topics, :slug, unique: true
  end
end

class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :research_topic_id
      t.integer :rating
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end

    add_index :votes, :user_id
    add_index :votes, :research_topic_id
  end
end

class CreateResponseSessions < ActiveRecord::Migration
  def change
    create_table :response_sessions do |t|
      t.integer :user_id
      t.integer :survey_id
      t.boolean :completed, default: false, null: false
      t.boolean :deleted, default: false, null: false
      t.boolean :locked, default: false, null: false
      t.string :encounter
      t.integer :child_id
      t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :response_sessions, :deleted
    add_index :response_sessions, :encounter
    add_index :response_sessions, :locked
    add_index :response_sessions, :user_id
    add_index :response_sessions, :child_id
    add_index :response_sessions, :survey_id
    add_index :response_sessions, [:survey_id, :encounter, :user_id, :child_id, :deleted], unique: true, name: 'response_sessions_idx'
  end
end

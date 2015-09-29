class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.integer :response_session_id
      t.string :state, default: "incomplete", null: false
      t.boolean :preferred_not_to_answer, default: false, null: false

      t.timestamps null: false
    end

    add_index :responses, [:response_session_id, :question_id], unique: true
    add_index :responses, :response_session_id
    add_index :responses, :question_id
    add_index :responses, :state
  end
end

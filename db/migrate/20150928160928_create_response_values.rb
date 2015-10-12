class CreateResponseValues < ActiveRecord::Migration
  def change
    create_table :response_values do |t|
      t.integer :response_id
      t.integer :answer_template_id
      t.integer :answer_option_id
      t.decimal :numeric_value
      t.string :text_value
      t.string :time_value

      t.timestamps null: false
    end

    add_index :response_values, :response_id
    add_index :response_values, :answer_option_id
    add_index :response_values, :answer_template_id
  end
end

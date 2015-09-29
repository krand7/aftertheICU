class CreateAnswerOptions < ActiveRecord::Migration
  def change
    create_table :answer_options do |t|
      t.string :text
      t.string :hotkey
      t.integer :value
      t.string :display_class
      t.integer :user_id
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end

    add_index :answer_options, :deleted
    add_index :answer_options, :user_id

    create_table :answer_options_answer_templates do |t|
      t.references :answer_template
      t.references :answer_option

      t.timestamps null: false
    end

    add_index :answer_options_answer_templates, :answer_template_id
    add_index :answer_options_answer_templates, :answer_option_id
  end
end

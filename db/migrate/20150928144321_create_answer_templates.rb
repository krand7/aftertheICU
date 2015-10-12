class CreateAnswerTemplates < ActiveRecord::Migration
  def change
    create_table :answer_templates do |t|
      t.string :name
      t.string :data_type
      t.integer :display_type_id
      t.boolean :allow_multiple, default: false, null: false
      t.integer :parent_answer_option_value
      t.integer :parent_answer_template_id
      t.string :text
      t.string :unit
      t.boolean :deleted, default: false, null: false
      t.integer :user_id
      t.string :type

      t.timestamps null: false
    end

    add_index :answer_templates, :deleted
    add_index :answer_templates, :parent_answer_template_id
    add_index :answer_templates, :user_id

    create_table :answer_templates_questions do |t|
      t.references :question
      t.references :answer_template

      t.timestamps null: false
    end

    add_index :answer_templates_questions, :question_id
    add_index :answer_templates_questions, :answer_template_id
  end
end

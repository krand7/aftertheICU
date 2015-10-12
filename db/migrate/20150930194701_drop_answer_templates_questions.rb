class DropAnswerTemplatesQuestions < ActiveRecord::Migration
  def change
    drop_table :answer_templates_questions
  end
end

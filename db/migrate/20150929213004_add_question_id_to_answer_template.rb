class AddQuestionIdToAnswerTemplate < ActiveRecord::Migration
  def change
    add_column :answer_templates, :question_id, :integer
  end
end

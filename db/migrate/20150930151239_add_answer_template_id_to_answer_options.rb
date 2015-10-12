class AddAnswerTemplateIdToAnswerOptions < ActiveRecord::Migration
  def change
    add_column :answer_options, :answer_template_id, :integer
  end
end

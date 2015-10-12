class RenameAnswerTemplateType < ActiveRecord::Migration
  def change
    rename_column :answer_templates, :type, :template_type
  end
end

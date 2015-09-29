class AnswerTemplatesQuestion < ActiveRecord::Base
  belongs_to :answer_template, -> { where deleted: false }
  belongs_to :question, -> { where deleted: false }
end

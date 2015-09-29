class AnswerOptionsAnswerTemplate < ActiveRecord::Base
  belongs_to :answer_template, -> { where deleted: false }
  belongs_to :answer_option, -> { where deleted: false }
end

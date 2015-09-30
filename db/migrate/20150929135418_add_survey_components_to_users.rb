class AddSurveyComponentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :survey_builder,               :boolean, default: false, null: false
    add_column :users, :accepted_consent_at,          :datetime
    add_column :users, :accepted_terms_of_access_at,  :datetime
    add_column :users, :accepted_update_at,           :datetime
    add_column :users, :left_study,                   :boolean, default: false, null: false
    add_column :users, :left_study_at,                :datetime
  end
end

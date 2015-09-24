class AddSocialElementsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :patient, :boolean,                                  default: false, null: false
    add_column :users, :caregiver, :boolean,                                default: false, null: false
    add_column :users, :provider, :boolean,                                 default: false, null: false
    add_column :users, :researcher, :boolean,                               default: false, null: false
    add_column :users, :over_eighteen, :boolean
    add_column :users, :forum_name, :string
    add_column :users, :photo, :string
  end
end

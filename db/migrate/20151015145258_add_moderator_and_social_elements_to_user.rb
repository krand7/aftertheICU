class AddModeratorAndSocialElementsToUser < ActiveRecord::Migration
  def change
    add_column :users, :moderator, :boolean, default: false, null: false
    add_column :users, :gender, :string
    add_column :users, :birthdate, :datetime
  end
end

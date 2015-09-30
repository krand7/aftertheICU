class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :designations
      t.string :role
      t.integer :position
      t.text :bio
      t.string :photo

      t.timestamps null: false
    end
  end
end

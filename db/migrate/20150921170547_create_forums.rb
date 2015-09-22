class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string   :name
      t.integer  :user_id
      t.text     :description
      t.integer  :views_count, default: 0,     null: false
      t.string   :slug
      t.integer  :position,    default: 0,     null: false
      t.boolean  :deleted,     default: false, null: false

      t.timestamps null: false
    end

    add_index :forums, :slug, unique: true
    add_index :forums, :user_id
  end
end

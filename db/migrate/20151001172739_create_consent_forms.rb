class CreateConsentForms < ActiveRecord::Migration
  def change
    create_table :consent_forms do |t|
      t.string :title
      t.string :name
      t.text :content
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end
  end
end

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :title, null: false
      t.integer :text, null: false
      t.references :user, foreign_key: true
      t.integer :type_id, null: false
      t.timestamps
    end
  end
end

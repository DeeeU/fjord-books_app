class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :postable, null: false, polymorphic: true
      t.references :user, null: false, foreign_key: true
      t.text :text, null: false
      t.timestamps
    end
  end
end

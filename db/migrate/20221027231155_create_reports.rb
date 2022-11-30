class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title, null: false
      t.string :text, null: false
      t.bigint :user_id, foreign_key: true
      t.timestamps
    end
  end
end

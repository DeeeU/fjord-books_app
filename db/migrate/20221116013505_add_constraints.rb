class AddConstraints < ActiveRecord::Migration[6.1]
  def up
    change_column :reports, :title, :text, null: false
    change_column :reports, :text, :text, null: false
    change_column :comments, :text, :text, null: false
    change_column :reports, :created_by, :bigint, foreign_key: true
  end
end

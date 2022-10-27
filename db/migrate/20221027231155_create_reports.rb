class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :text
      t.integer :created_by
      t.timestamps
    end
  end
end

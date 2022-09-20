class AddCreatedByToReport < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :created_by, :integer
  end
end

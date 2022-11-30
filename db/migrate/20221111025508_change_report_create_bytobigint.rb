class ChangeReportCreateBytobigint < ActiveRecord::Migration[6.1]
  def up
    change_column :reports, :created_by, 'bigint USING CAST(parent_id AS bigint)'
  end
end

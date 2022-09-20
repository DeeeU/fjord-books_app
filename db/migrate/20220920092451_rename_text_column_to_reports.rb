class RenameTextColumnToReports < ActiveRecord::Migration[6.1]
  def change
    rename_column :reports, :text, :memo
  end
end

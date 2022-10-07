class RemoveTypeIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :type_id, :integer
  end
end

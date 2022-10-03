class ChangeDataTypeTitleTextTypeIdOfComments < ActiveRecord::Migration[6.1]
  def up
    change_column :comments, :title, :string
    change_column :comments, :text, :text
  end
end

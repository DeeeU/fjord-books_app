class AddReferencesToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :postable, polymorphic: true
  end
end

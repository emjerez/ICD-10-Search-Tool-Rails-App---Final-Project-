class RemoveParentIdFromCode < ActiveRecord::Migration[5.1]
  def change
    remove_reference :codes, :parent
  end
end

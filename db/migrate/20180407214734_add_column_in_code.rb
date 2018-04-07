class AddColumnInCode < ActiveRecord::Migration[5.1]
  def change
    add_column :codes, :inclusionTerm, :text
  end
end

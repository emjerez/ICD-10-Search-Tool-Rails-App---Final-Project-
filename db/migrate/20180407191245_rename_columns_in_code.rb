class RenameColumnsInCode < ActiveRecord::Migration[5.1]
  def change
    rename_column :codes, :code, :code_id
    rename_column :codes, :title, :desc
    add_column :codes, :chapter, :string
    add_column :codes, :section_name, :string
    add_column :codes, :includes, :text
    add_column :codes, :excludes1, :text
    add_column :codes, :excludes2, :text
    add_column :codes, :parent_id, :string
  end
end

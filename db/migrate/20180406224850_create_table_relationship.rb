class CreateTableRelationship < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships, id: false do |t|
      t.integer :parent_id
      t.integer :child_id
    end

    add_index(:relationships, [:parent_id, :child_id], :unique => true)
    add_index(:relationships, [:child_id, :parent_id], :unique => true)

  end
end

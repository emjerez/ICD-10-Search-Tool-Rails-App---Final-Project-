class CreateCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|
      t.string :code
      t.string :title

      t.references :parent, index: true

      t.timestamps
    end
  end
end

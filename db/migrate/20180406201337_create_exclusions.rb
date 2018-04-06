class CreateExclusions < ActiveRecord::Migration[5.1]
  def change
    create_table :exclusions do |t|
      t.string :type
      t.string :description
      t.belongs_to :code, foreign_key: true

      t.timestamps
    end
  end
end

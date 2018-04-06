class CreateInclusionTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :inclusion_terms do |t|
      t.string :description
      t.belongs_to :code, foreign_key: true

      t.timestamps
    end
  end
end

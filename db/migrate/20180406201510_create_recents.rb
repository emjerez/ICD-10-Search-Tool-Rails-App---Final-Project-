class CreateRecents < ActiveRecord::Migration[5.1]
  def change
    create_table :recents do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :code, foreign_key: true

      t.timestamps
    end
  end
end

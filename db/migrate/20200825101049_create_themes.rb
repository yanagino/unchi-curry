class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :title
      t.string :theme1
      t.string :theme2
      t.integer :vote1
      t.integer :vote2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

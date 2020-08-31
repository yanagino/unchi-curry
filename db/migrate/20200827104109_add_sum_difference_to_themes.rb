class AddSumDifferenceToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :sum, :integer
    add_column :themes, :difference, :integer
  end
end

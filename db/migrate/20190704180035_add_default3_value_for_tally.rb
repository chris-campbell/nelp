class AddDefault3ValueForTally < ActiveRecord::Migration[5.0]
  def change
    change_column :tallies, :score, :integer, default: 0
  end
end

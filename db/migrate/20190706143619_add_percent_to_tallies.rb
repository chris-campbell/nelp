class AddPercentToTallies < ActiveRecord::Migration[5.0]
  def change
    add_column :tallies, :percent, :integer, default: 0
  end
end

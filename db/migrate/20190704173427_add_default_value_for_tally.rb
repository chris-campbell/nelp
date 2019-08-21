class AddDefaultValueForTally < ActiveRecord::Migration[5.0]
  def change
    change_column :tallies, :tally_yes, :integer,  default: 0
    change_column :tallies, :tally_no, :integer,  default: 0
  end
end

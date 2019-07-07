class AddPlaceIndexToTallies < ActiveRecord::Migration[5.0]
  def change
    add_column :tallies, :place_id, :integer
    add_index :tallies, :place_id
  end
end

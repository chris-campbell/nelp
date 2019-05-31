class AddRangeToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :range, :string
  end
end

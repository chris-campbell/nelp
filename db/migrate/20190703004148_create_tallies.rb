class CreateTallies < ActiveRecord::Migration[5.0]
  def change
    create_table :tallies do |t|
      t.integer :tally_yes
      t.integer :tally_no
      t.integer :score

      t.timestamps
    end
  end
end

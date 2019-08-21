class AddTallyIdToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :tally_id, :integer
  end
end

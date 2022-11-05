class RemoveRatingFromIsland < ActiveRecord::Migration[7.0]
  def change
    remove_column :islands, :rating, :integer
  end
end

class AddDetailsToIsland < ActiveRecord::Migration[7.0]
  def change
    add_column :islands, :island_pic, :string
    add_column :islands, :rating, :integer
  end
end

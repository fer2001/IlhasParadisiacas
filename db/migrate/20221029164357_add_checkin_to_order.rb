class AddCheckinToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :checkin, :date
    add_column :orders, :checkout, :date
  end
end

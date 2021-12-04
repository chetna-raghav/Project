class AddAvailableseatsColumnToBusowners < ActiveRecord::Migration[6.1]
  def change
    add_column :busowners, :Availableseats, :integer
  end
end

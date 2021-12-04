class AddAvailableseatsColumnToBusinfos < ActiveRecord::Migration[6.1]
  def change
    add_column :businfos, :Availableseats, :integer
  end
end

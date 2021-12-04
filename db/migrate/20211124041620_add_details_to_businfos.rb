class AddDetailsToBusinfos < ActiveRecord::Migration[6.1]
  def change
    add_column :businfos, :boarding1, :string
    add_column :businfos, :time1, :time
    add_column :businfos, :boarding2, :string
    add_column :businfos, :time2, :string
    add_column :businfos, :boarding3, :string
    add_column :businfos, :time3, :time
  end
end

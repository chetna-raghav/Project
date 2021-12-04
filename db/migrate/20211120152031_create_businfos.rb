class CreateBusinfos < ActiveRecord::Migration[6.1]
  def change
    create_table :businfos do |t|
      t.integer :Bus_Number
      t.string :Bus_Name
      t.string :Source
      t.string :Destination
      t.integer :Number_Of_Seats
      t.integer :Remaining_Seats
      t.integer :Price
      t.date :Date
      t.time :Time
      t.integer :Time_taken
      t.references :busowner, null: false, foreign_key: true

      t.timestamps
    end
  end
end

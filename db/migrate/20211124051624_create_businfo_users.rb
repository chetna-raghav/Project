class CreateBusinfoUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :businfo_users do |t|
      t.string :boardingPoint
      t.time :time
      t.references :user, null: false, foreign_key: true
      t.references :businfo, null: false, foreign_key: true

      t.timestamps
    end
  end
end

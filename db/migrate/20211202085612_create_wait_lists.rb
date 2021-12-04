class CreateWaitLists < ActiveRecord::Migration[6.1]
  def change
    create_table :wait_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :businfo, null: false, foreign_key: true

      t.timestamps
    end
  end
end

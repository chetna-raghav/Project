class CreateBusowners < ActiveRecord::Migration[6.1]
  def change
    create_table :busowners do |t|
      t.text :email,null: false
      t.string :password_digest

      t.timestamps
    end
  end
end

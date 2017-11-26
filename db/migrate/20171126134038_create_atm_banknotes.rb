class CreateAtmBanknotes < ActiveRecord::Migration[5.1]
  def change
    create_table :atm_banknotes do |t|
      t.integer :atm_id
      t.integer :banknote_id
      t.integer :amount
      t.integer :operation

      t.timestamps
    end
  end
end

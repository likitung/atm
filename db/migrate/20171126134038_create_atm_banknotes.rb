class CreateAtmBanknotes < ActiveRecord::Migration[5.1]
  def change
    create_table :atm_banknotes do |t|
      t.integer :atm_id
      t.integer :banknote_id
      t.string  :amount

      t.timestamps
    end
  end
end

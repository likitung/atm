class CreateBanknotes < ActiveRecord::Migration[5.1]
  def change
    create_table :banknotes do |t|
      t.integer :value
      t.timestamps
    end
  end
end

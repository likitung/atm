class Atm < ApplicationRecord
  def change
    create_table :atms do |t|
      t.timestamps
    end
  end
end

class CreateAtms < ActiveRecord::Migration[5.1]
  def change
    create_table :atms do |t|
      t.string :name
      t.timestamps
    end
  end
end

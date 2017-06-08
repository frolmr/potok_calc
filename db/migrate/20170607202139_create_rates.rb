class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.decimal :optimistic
      t.decimal :realistic
      t.timestamps
    end
  end
end

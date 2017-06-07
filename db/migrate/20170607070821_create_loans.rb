class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.decimal :body
      t.decimal :payments, array: true
      t.decimal :profit
      t.timestamps
    end
  end
end

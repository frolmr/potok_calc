class AddTermToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :term, :integer
  end
end

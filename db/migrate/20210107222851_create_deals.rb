class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.integer :type_transaction
      t.string :description
      t.string :nature
      t.string :signal

      t.timestamps
    end
  end
end

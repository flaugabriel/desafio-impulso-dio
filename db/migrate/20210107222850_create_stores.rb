class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :store_owner
      t.string :cpf
      t.string :store_name
      t.decimal :balance_total

      t.timestamps
    end
  end
end

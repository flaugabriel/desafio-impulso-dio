class AddUserIdToCnab < ActiveRecord::Migration[6.1]
  def change
    add_reference :cnabs, :user, null: false, foreign_key: true
    add_reference :cnabs, :store, null: false, foreign_key: true
  end
end

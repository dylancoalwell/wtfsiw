class CreateWinnersTable < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.string   :title
      t.string   :poster
      t.integer  :user_id

      t.timestamps(null: false)
    end
  end
end

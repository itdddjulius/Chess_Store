class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :item, index: true, foreign_key: true
      t.integer :quantity
      t.date :date

      # t.timestamps null: false
    end
  end
end

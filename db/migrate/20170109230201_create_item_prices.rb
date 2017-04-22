class CreateItemPrices < ActiveRecord::Migration
  def change
    create_table :item_prices do |t|
      t.references :item, index: true, foreign_key: true
      t.float :price
      t.string :category
      t.date :start_date
      t.date :end_date

      # t.timestamps null: false
    end
  end
end

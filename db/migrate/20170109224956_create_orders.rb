class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.references :school, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.float :grand_total
      t.string :payment_receipt

      # t.timestamps null: false
    end
  end
end

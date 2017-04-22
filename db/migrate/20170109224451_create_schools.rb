class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :min_grade
      t.integer :max_grade
      t.boolean :active, default: true

      # t.timestamps null: false
    end
  end
end

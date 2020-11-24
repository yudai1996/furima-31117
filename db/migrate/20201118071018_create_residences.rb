class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string  :postal_code,    null: false
      t.integer :prefecture_id, null: false
      t.string  :city,           null: false
      t.string  :house_number,   null: false
      t.string  :building,       null: false
      t.string  :phone_number,   null: false
      t.timestamps
    end
  end
end

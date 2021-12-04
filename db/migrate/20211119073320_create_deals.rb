class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.float :price
      t.float :discount
      t.integer :quantity
      t.date :publish_date
      t.string :image
    end
  end
end

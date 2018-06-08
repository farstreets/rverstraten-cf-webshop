class CreateNewProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.color :color
      t.price :price
      t.string :image_url

      t.timestamps
    end
  end
end

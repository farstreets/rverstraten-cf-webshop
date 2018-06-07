class AddColorAndPrice < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :color, :string
    add_column :products, :price, :decimal
  end
end

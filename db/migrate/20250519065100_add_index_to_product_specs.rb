class AddIndexToProductSpecs < ActiveRecord::Migration[5.0]
  def change
    add_index :product_specs, :product_id
    add_index :product_specs, [:product_id, :key], unique: true
  end
end

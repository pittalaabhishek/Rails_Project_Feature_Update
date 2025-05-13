class CreateProductSpecs < ActiveRecord::Migration
  def change
    create_table :product_specs do |t|
      t.references :product, null: false, foreign_key: true
      t.string :key, null: false
      t.string :value, null: false
      t.timestamps
    end
  end
end
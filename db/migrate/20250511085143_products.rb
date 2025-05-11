class Products < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :attributes
      t.timestamps
    end
  end
end
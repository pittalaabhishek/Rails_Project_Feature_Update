class RenameAttributesToProductAttributes < ActiveRecord::Migration
  def change
    rename_column :products, :attributes, :product_attributes
  end
end

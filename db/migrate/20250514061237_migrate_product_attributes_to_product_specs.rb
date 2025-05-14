class MigrateProductAttributesToProductSpecs < ActiveRecord::Migration
  def up
    # Step 1: Move data from product_attributes to product_specs
    expected_count = 0
    attributes_migrated = true
    Product.find_each do |product|
      if product.product_attributes.is_a?(Hash)
        expected_count += product.product_attributes.size
        product.product_attributes.each do |key, value|
          ProductSpec.create!(
            product_id: product.id,
            key: key.to_s,
            value: value.to_s
          )
        end
      end
    end
    
    # Check if we migrated the expected number of attributes
    if expected_count > 0
      actual_count = ProductSpec.count
      
      if actual_count == expected_count
        remove_column :products, :product_attributes
        puts "Migration successful: #{actual_count} product specs created."
      else
        attributes_migrated = false
        raise ActiveRecord::Rollback
        puts "Warning: Expected to create #{expected_count} product specs, but only created #{actual_count}."
        puts "Column 'product_attributes' not removed from products table."
      end
    else
      puts "No product attributes found to migrate."
      remove_column :products, :product_attributes
    end
  end

  def down
    add_column :products, :product_attributes, :text
    Product.find_each do |product|
      attributes = {}
      product.product_specs.each do |spec|
        attributes[spec.key] = spec.value
      end
      
      product.update_column(:product_attributes, attributes)
    end
  end
end
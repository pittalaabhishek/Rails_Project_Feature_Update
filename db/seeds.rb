# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create!([
  { 
    name: "Laptop", 
    product_attributes: { "brand" => "Dell", "ram" => "16GB", "storage" => "512GB SSD" } 
  },
  { 
    name: "Smartphone", 
    product_attributes: { "brand" => "Apple", "model" => "iPhone 13", "color" => "Midnight" } 
  },
  { 
    name: "Headphones", 
    product_attributes: { "brand" => "Sony", "type" => "Wireless", "noise_cancelling" => true } 
  }
])
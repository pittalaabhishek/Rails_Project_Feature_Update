class Product < ActiveRecord::Base
  serialize :product_attributes, Hash

  validates :name, presence: true

  def assign_attributes_from_raw(raw_attributes)
    self.product_attributes = raw_attributes.each_with_object({}) do |attr, hash|
      next if attr["key"].blank?
      hash[attr["key"]] = attr["value"]
    end
  end
end
class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :curted_products
  has_many :products, through: :curted_products
end

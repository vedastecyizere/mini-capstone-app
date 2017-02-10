class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  belongs_to :user, optional: true 
  has_many :category_products 
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, presence: true
  validates :price, numericality: {greater_than: 0}



  def tax 
    price * 0.09
  end 
  
end

class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :carted_products
  has_many :orders, through: :carted_products
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0 }
  validates :description, length: { in: 10..500 }


  def is_discounted?
    price.to_i < 10
  end

  def tax
    price * 0.09
  end
 
  def total
    price + tax
  end

end








class User < ActiveRecord::Base
  has_many :reviews
  has_many :reviewed_products, through: :reviews, source: :product
  has_many :shops
end
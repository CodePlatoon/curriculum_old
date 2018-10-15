class Actor < ActiveRecord::Base
  has_many :roles
  has_many :movies, through: :roles
end

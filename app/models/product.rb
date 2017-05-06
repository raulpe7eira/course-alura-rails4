class Product < ApplicationRecord

  validates :name, length: { minimum: 5 }
  validates :amount, presence: true

end

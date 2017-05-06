class Product < ApplicationRecord

  belongs_to :department

  validates :name, length: { minimum: 5 }
  validates :amount, presence: true

end

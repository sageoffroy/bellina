class SaleDetail < ApplicationRecord
  belongs_to :sale, optional: false
  belongs_to :footwear, optional: false

  validates_presence_of :footwear
end

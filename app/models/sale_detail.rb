class SaleDetail < ApplicationRecord
  belongs_to :sale, optional: false
  belongs_to :footwear
end

class Sale < ApplicationRecord
  belongs_to :client
  has_many :sale_details, inverse_of: :sale
  accepts_nested_attributes_for :sale_details, reject_if: :all_blank, allow_destroy: true

  

end

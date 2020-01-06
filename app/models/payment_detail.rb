class PaymentDetail < ApplicationRecord
  belongs_to :payment, optional: false
  belongs_to :way_pay
end

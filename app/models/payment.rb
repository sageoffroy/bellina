class Payment < ApplicationRecord
  belongs_to :client
  has_many :payment_details, inverse_of: :payment, dependent: :destroy
  accepts_nested_attributes_for :payment_details, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :client
  validates_presence_of :payment_date


  def get_amount
  	self.payment_details.sum(:amount)
  end

end

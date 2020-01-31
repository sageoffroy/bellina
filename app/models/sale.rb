class Sale < ApplicationRecord
  belongs_to :client
  has_many :sale_details, inverse_of: :sale, dependent: :destroy
  accepts_nested_attributes_for :sale_details, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :client
  validates_presence_of :date_sale

  def get_amount
  	self.sale_details.sum(:real_price).to_f
  end

end

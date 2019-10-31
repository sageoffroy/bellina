class Footwear < ApplicationRecord
  belongs_to :trademark
  belongs_to :category
  belongs_to :color
  belongs_to :release_country, optional:true
  belongs_to :size
  belongs_to :season, optional:true

  validates_presence_of :stock
  validates_presence_of :stock_warning
  validates_presence_of :wholesale_price

  

  def create_sku
  	self.sku = category.code + (sprintf '%07d', id)
  end

  def get_retail_price
  	wholesale_price * WayPay.first.c1	
  end

  def calculate_way_pay(way_pay_name, monthly)
  	return get_retail_price() * WayPay.where(name: way_pay_name).first.get_index(monthly)
  end

  def to_s
    sku
  end

end




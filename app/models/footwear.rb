require 'barby'
require 'barby/barcode/ean_13'
require 'barby/outputter/html_outputter'

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
  validates_presence_of :color_id
  validates_presence_of :size_id
  validates_presence_of :trademark
  validates_presence_of :category


  has_one_attached :avatar
  
  def get_select_description
    "(" + self.sku + ") " + self.category.to_s + " " + self.trademark.to_s
  end

  def create_sku
    sku = self.sku
    calc = (((sku [1].to_i + sku[3].to_i + sku[5].to_i + sku[7].to_i + sku[9].to_i + sku[11].to_i) * 3) + (sku[0].to_i + sku[2].to_i + sku[4].to_i + sku[6].to_i + sku[8].to_i + sku[10].to_i)).digits.first
    if calc > 0
      verification_value = 10 - calc
    else
      verification_value = 0
    end

  	self.sku = '779999' + (sprintf '%06d', id) + verification_value.to_s
  end

  
  def get_barcode
    Barby::HtmlOutputter.new(Barby::EAN13.new(self.sku[0..11]))
  end


  def get_retail_price
  	wholesale_price * WayPay.first.c1	
  end

  def calculate_way_pay(way_pay_name, monthly)
  	return get_retail_price() * WayPay.where(name: way_pay_name).first.get_index(monthly)
  end

  def dec_stock(count)
    self.stock = self.stock - count
  end

  def inc_stock(count)
    self.stock = self.stock + count
  end

  def to_s
    sku
  end

end




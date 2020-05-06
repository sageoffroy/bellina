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
    if article.nil? or article.blank? 
      "(" + self.sku + ") " + self.category.to_s + " " + self.trademark.to_s
    else
      "(" + self.sku + ") " + self.category.to_s + " " + self.article
    end
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
    if self.sku[0] == 7
      bar_code = Barby::PngOutputter.new(Barby::EAN13.new(self.sku[0..11]))
    else
      bar_code = Barby::PngOutputter.new(Barby::Code39.new(self.sku[0..14],true))
    end
    bar_code.margin = 5 
    bar_code.height = 45
    
    File.open('app/assets/images/barcode.png', 'wb'){|f| f.write bar_code.to_png }
    
  end


  def get_retail_price
    if !retail_price.nil? and retail_price.to_i != 0
      retail_price
    else
      wholesale_price * 2.2
    end
  end

  def calculate_way_pay(way_pay_name, monthly)
    if WayPay.where(name: way_pay_name).first.get_index(monthly).nil?
      return nil
    else
      if self.retail_price.nil?
        self.retail_price = self.wholesale_price * 2.2
      end
      return self.retail_price * WayPay.where(name: way_pay_name).first.get_index(monthly)
    end
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




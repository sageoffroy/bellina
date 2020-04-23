class FootwearsController < ApplicationController
  before_action :set_footwear, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token



  # GET /footwears
  # GET /footwears.json
  def index
    @footwears = Footwear.all
  end

  # GET /footwears/1
  # GET /footwears/1.json
  def show
    @footwear.get_barcode
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template:'footwears/template', pdf:'Nombre', page_size: nil, page_width:'1.8in', page_height:'1.25in', margin:{top:'0.01in', bottom:'0.01in',left:'0.01in',right:'0.01in'}}
    end
  end

  # GET /footwears/new
  def new
    @footwear = Footwear.new
  end

  # GET /footwears/1/edit
  def edit
  end

  # POST /footwears
  # POST /footwears.json
  def create
    @footwear = Footwear.new(footwear_params)
    
      
    respond_to do |format|
      if @footwear.save
        if @footwear.sku.blank?
          @footwear.create_sku()
        end

        if @footwear.short_description.blank?
          @footwear.short_description = @footwear.category.to_s + " " + @footwear.trademark.to_s + " " + @footwear.size.to_s + " " + @footwear.color.to_s
        end

        if @footwear.retail_price.nil?
          @footwear.retail_price = @footwear.wholesale_price * 2.2
        end

        @footwear.save
        format.html { redirect_to @footwear, notice: 'Footwear was successfully created.' }
        format.json { render :show, status: :created, location: @footwear }
      else
        format.html { render :new }
        format.json { render json: @footwear.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /get_footwear_value/1
  def get_retail_price
    id = params[:id]
    retail_price = Footwear.where(id:id).first.get_retail_price
    respond_to do |format|
      format.json  { render :json => {:function => "get_retail_price", :retail_price => retail_price}}
    end

  end


  def get_footwear_id
    sku = params[:sku]
    id = Footwear.where(sku:sku).first.id
    respond_to do |format|
      format.json  { render :json => {:function => "get_footwear_id", :id => id}}
    end
    
  end


  # PATCH/PUT /footwears/1
  # PATCH/PUT /footwears/1.json
  def update
    respond_to do |format|
      if @footwear.update(footwear_params)
        if @footwear.sku.blank?
          @footwear.create_sku()
        end
        if @footwear.short_description.blank?
          @footwear.short_description = @footwear.category.to_s + " " + @footwear.trademark.to_s + " " + @footwear.size.to_s + " " + @footwear.color.to_s
        end
        @footwear.save
        format.html { redirect_to @footwear, notice: 'Footwear was successfully updated.' }
        format.json { render :show, status: :ok, location: @footwear }
      else
        format.html { render :edit }
        format.json { render json: @footwear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /footwears/1
  # DELETE /footwears/1.json
  def destroy
    @footwear.destroy
    respond_to do |format|
      format.html { redirect_to footwears_url, notice: 'Footwear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_footwear
      @footwear = Footwear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def footwear_params
      params.require(:footwear).permit(:sku, :article, :trademark_id, :category_id, :color_id, :stock, :stock_warning, :wholesale_price, :wholesale_price, :retail_price, :retail_price, :gender, :active, :short_description, :long_description, :release_date, :release_country_id, :size_id, :weight, :season_id, :avatar, :sex, :ean13_code)
    end
end

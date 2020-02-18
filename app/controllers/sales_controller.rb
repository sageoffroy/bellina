class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale_details = SaleDetail.where(sale: @sale)

  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end


  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    @sale.state = "Iniciada"
    respond_to do |format|
      if @sale.save

        #incrementar stock
        @sale.sale_details.each do |sd|
          fw = Footwear.where(id:sd.footwear_id).first
          fw.dec_stock(sd.count)
          fw.save
        end

        

        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      @sale.sale_details.each do |sd|
        fw = Footwear.where(id:sd.footwear_id).first
        fw.inc_stock(sd.count)
        fw.save
      end


      if @sale.update(sale_params)
        @sale.sale_details.each do |sd|
          fw = Footwear.where(id:sd.footwear_id).first
          fw.dec_stock(sd.count)
          fw.save
        end
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.sale_details.each do |sd|
      fw = Footwear.where(id:sd.footwear_id).first
      fw.inc_stock(sd.count)
      fw.save
    end
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:date_sale, :client_id, :state, sale_details_attributes: [:id, :footwear_id, :count, :real_price, :_destroy])
    end
end

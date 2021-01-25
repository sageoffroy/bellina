class WayPaysController < ApplicationController
  before_action :set_way_pay, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /way_pays
  # GET /way_pays.json
  def index
    @way_pays = WayPay.all
  end

  # GET /way_pays/1
  # GET /way_pays/1.json
  def show
  end

  # GET /way_pays/new
  def new
    @way_pay = WayPay.new
  end

  # GET /way_pays/1/edit
  def edit
  end

  # POST /way_pays
  # POST /way_pays.json
  def create
    @way_pay = WayPay.new(way_pay_params)

    respond_to do |format|
      if @way_pay.save
        format.html { redirect_to @way_pay, notice: 'Way pay was successfully created.' }
        format.json { render :show, status: :created, location: @way_pay }
      else
        format.html { render :new }
        format.json { render json: @way_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /way_pays/1
  # PATCH/PUT /way_pays/1.json
  def update
    respond_to do |format|
      if @way_pay.update(way_pay_params)
        format.html { redirect_to @way_pay, notice: 'Way pay was successfully updated.' }
        format.json { render :show, status: :ok, location: @way_pay }
      else
        format.html { render :edit }
        format.json { render json: @way_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /way_pays/1
  # DELETE /way_pays/1.json
  def destroy
    @way_pay.destroy
    respond_to do |format|
      format.html { redirect_to way_pays_url, notice: 'Way pay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_way_pay_interest
    id = params[:id]
    fee = params[:fee]

    case fee
      when "1"
        interest = WayPay.where(id:id).first.c1
      when "3"
        interest = WayPay.where(id:id).first.c3
      when "6"
        interest = WayPay.where(id:id).first.c6
      when "9"
        interest = WayPay.where(id:id).first.c9
      when "12"
        interest = WayPay.where(id:id).first.c12
      end
      respond_to do |format|
        format.json  { render :json => {:function => "get_way_pay_interest", :interest => interest}}
      end

  end

  def get_fees
    total = params[:total].to_i
    fees_array = []
    WayPay.all.each do |wp|
      if wp.name.upcase != "DEBITO" and wp.name.upcase != "EFECTIVO"
        fees_array.push([wp.name, wp.get_interest(total,3), wp.get_interest(total,6), wp.get_interest(total,9),wp.get_interest(total,12)])
      end
    end
    respond_to do |format|
      format.json  { render :json => {:function => "get_fees", :fees_array => fees_array}}
    end

  end

  private
    def set_way_pay
      @way_pay = WayPay.find(params[:id])
    end

    def way_pay_params
      params.require(:way_pay).permit(:name, :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8, :c9, :c10, :c11, :c12, :c13, :c14, :c15, :c16, :c17, :c18, :order)
    end
end

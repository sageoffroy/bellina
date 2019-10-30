class WayPaysController < ApplicationController
  before_action :set_way_pay, only: [:show, :edit, :update, :destroy]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_way_pay
      @way_pay = WayPay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def way_pay_params
      params.require(:way_pay).permit(:name, :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8, :c9, :c10, :c11, :c12, :c13, :c14, :c15, :c16, :c17, :c18)
    end
end

class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    sales_client = Sale.where(client: @client)
    payments_client = Payment.where(client: @client)

    @movement = []

    sales_client.each do |sale|
      @movement << ["compra", sale.id, sale.date_sale, sale.get_amount * -1]
    end

    payments_client.each do |payment|
      @movement << ["pago", payment.id, payment.payment_date, payment.get_amount]
    end

  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # GET /get_footwear_value/1
  def get_client_debt
    id = params[:id]
    debt = Client.where(id:id).first.get_debt
    respond_to do |format|
      format.json  { render :json => {:function => "get_client_price", :debt => debt}}
    end
  end


  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:dni, :fullname, :mail, :telephone, :address, :avanzar)
    end
end

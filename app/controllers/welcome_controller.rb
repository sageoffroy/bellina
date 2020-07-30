class WelcomeController < ApplicationController
	def index
		@footwears = Footwear.all.count
		@providers = Provider.all.count
		@clients = Client.all.count
		@sales = Sale.all.count


		day = params[:day]
		month = params[:month]
	    year = params[:year]

    

	    if day.nil? or month.nil? or year.nil?
	    	date_table = Date.today.all_day
	    else
	    	date_table = Date.new(year.to_i, month.to_i, day.to_i)
	    end
		payments_of_day = []
		sales_of_day = []
		@movements = []
		movements = []

		payments_of_day = Payment.where(payment_date: date_table)
		sales_of_day = Sale.where(date_sale: date_table)
		
		@ventas_total = 0
    	sales_of_day.each do |sale|
    		@ventas_total = @ventas_total + sale.get_amount
      		movements << ["venta", sale.id, sale.date_sale, sale.client, sale.get_amount]
    	end	

    	@pagos_total = 0
    	@efectivo_total = 0
    	@debito_total = 0
    	@tarjetas_total = 0
    	@credito_total = 0
    	@avanzar_total = 0
    	payments_of_day.each do |payment|
      		movements << ["pago", payment.id, payment.payment_date, payment.client, payment.get_real_amount]
      		@pagos_total = @pagos_total + payment.get_real_amount
      		payment.payment_details.each do |detail|
      			if detail.real_amount != 0
	      			case detail.way_pay.name
	      			when "DEBITO"
	      				@debito_total = @debito_total + detail.real_amount
	      			when "EFECTIVO"
	      				@efectivo_total = @efectivo_total + detail.real_amount
	      			when "AVANZAR"
	      				@avanzar_total = @avanzar_total + detail.real_amount
	      			when "CREDITO"
	      				@credito_total = @credito_total + detail.real_amount
	      			else
	      				@tarjetas_total = @tarjetas_total + detail.real_amount
	      			end
	      		end
      		end

    	end

    	@movements = movements

		sales_of_months = []
		(1..12).each do |i|
			if Rails.env.production?
				sales_of_months.push(Sale.where("extract(month from created_at) + 0 = ?", i).count)       #Otros
			else
				sales_of_months.push(Sale.where("cast(strftime('%m', date_sale) as int) = ?", i).count)  #SQLite
			end
		end

		@data = {
			labels: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
			datasets:[{
				label: 'Ventas',
				lineTension: 0.3,
				backgroundColor: 'rgba(2,117,216,0.2)',
				borderColor: 'rgba(2,117,216,1)',
				pointRadius: 5,
				pointBackgroundColor: 'rgba(2,117,216,1)',
				pointBorderColor: 'rgba(255,255,255,0.8)',
				pointHoverRadius: 5,
				pointHoverBackgroundColor: 'rgba(2,117,216,1)',
				pointHitRadius: 50,
				pointBorderWidth: 2,
				data: sales_of_months
			}]
		}

		@options = {
			maintainAspectRatio: false,
			responsive: true,
			height: 200,
			scales: {
				xAxes: [{
					time: {
						unit: 'date'
					},
					gridLines: {
						display: false
					},
					ticks: {
						maxTicksLimit: 20
					}
	      }],
	      yAxes: [{
					ticks: {
						maxTicksLimit: 200
					},
					gridLines: {
						color: 'rgba(0, 0, 0, .125)'
					}
	      }]
	    },
	    legend: {
	      display: false
	    }

	  }
  end



  def set_period
  	month = params[:month]
    year = params[:year]
    current_user.period = month+year
    current_user.save
    
    respond_to do |format|
      format.json  { render :json => {:month => month, :year => year}}
    end
  

		payments_of_day = []
		sales_of_day = []
		@movements = []
		movements = []

		payments_of_day = Payment.where(payment_date: Date.today.all_day)
		sales_of_day = Sale.where(date_sale: Date.today.all_day)


		sales_of_day.each do |sale|
				movements << ["compra", sale.id, sale.date_sale, sale.client, sale.get_amount * -1]
		end	

		payments_of_day.each do |payment|
				movements << ["pago", payment.id, payment.payment_date, payment.client, payment.get_amount]
		end

		@movements = movements


  end


end

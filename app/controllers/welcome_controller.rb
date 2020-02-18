class WelcomeController < ApplicationController
	def index
		@footwears = Footwear.all.count
		@providers = Provider.all.count
		@clients = Client.all.count
		@sales = Sale.all.count

		

		sales_of_months = []
		(1..12).each do |i|
			sales_of_months.push(Sale.where("cast(strftime('%m', date_sale) as int) = ?", i).count)
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


  def get_data



  end


end

class HomeController < ApplicationController
  def index
    @waiting_on = Delivery.where({ :arrived => false })
    @received = Delivery.where({ :arrived => true })

    render({ :template => "home/index.html.erb" })
  end
end

class DeliveriesController < ApplicationController
  before_action :force_user_sign_in

  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    render({ :template => "deliveries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show.html.erb" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.user_id = @current_user.id

    the_delivery.description = params.fetch("description")
    the_delivery.details = params.fetch("query_details")
    the_delivery.supposed_to_arrive_at = params.fetch("supposed_to_arrive_at")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/", { :notice => "Added to list." })
    else
      redirect_to("/", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)
    

    the_delivery.arrived = params.fetch("arrived")

    if the_delivery != nil
      the_delivery.save
      redirect_to("/", { :notice => "Delivery updated successfully." })
    else
      redirect_to("/deliveries/#{the_delivery.id}", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.delete

    redirect_to("/", { :notice => "Delivery deleted successfully." })
  end
end

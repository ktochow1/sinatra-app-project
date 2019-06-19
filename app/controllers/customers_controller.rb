class CustomersController < ApplicationController

  get '/bouquets/customer/:id' do
    @customer = Customer.find(params[:id])
    # @customer.current_customer
    @bouquets = Customer.bouquets
    erb :'/customers/show'
  end

end


#   -updating, editing, showpage, deleting
# end

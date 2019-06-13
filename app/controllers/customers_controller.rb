class CustomersController < ApplicationController

  get '/bouquets/:slug' do
    @bouquet = Bouquet.find_by_slug(params[:slug])
    erb :'/bouquets/show'
  end

end


#   -updating, editing, showpage, deleting
# end

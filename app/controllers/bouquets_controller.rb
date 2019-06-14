class BouquetsController < ApplicationController


  get '/bouquets' do
     if logged_in?
       @bouquet = Bouquet.all
        # binding.pry
       erb :'/bouquets/index'
    else
      redirect "/login"
    end
  end

  # get '/bouquets/new' do
  #   erb :'/bouquets/create_new'
  # end

  # post '/bouquets' do
  #   @bouquet = Bouquet.create(name: params[:name], occassion: params[:occassion], accessories: params[:accessories], flower_name: params[:flower_name], flower_quantity: params[:flower_quantity], customer_id: current_customer.id)
  #   erb :'/bouquets/show'
  #  end
    #
    # get '/bouquets/:id' do
    #   @bouquet = Bouquet.find(params[:slug])
    #   erb :'/bouquets/show'
    # end
    #
    # patch '/bouquets/edit/:id' do
    #
    # end

    delete '/bouquets/:id' do
      @bouquet = Bouquet.find(params[:id])
          # binding.pry
      if logged_in? && current_customer.bouquets.include?(@bouquet)
        @bouquet.delete
         redirect "/bouquets"
      else
      redirect "/login"
      end
    end



end

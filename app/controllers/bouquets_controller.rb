class BouquetsController < ApplicationController




  get '/bouquets' do
     if logged_in?
       @bouquets = Bouquet.all
       erb :'/bouquets/index'
    else
      redirect "/login"
    end
  end

  get '/bouquets/new' do
    erb :'/bouquets/create_new'
  end

  post '/bouquets/new' do
    # if params[:occasion] != "" && params[:ribbon_color] != "" && params[:vase] != ""
    @bouquet = Bouquet.create(name: params[:name], occassion: params[:occassion], accessories: params[:accessories], flower_name: params[:flower_name], flower_quantity: params[:flower_quantity], customer_id: current_customer)
      # if !@bouquet.flower_quantity.integer?
      # end

    # binding.pry
    erb :'/bouquets/show_new'

   end

    get '/bouquets/:slug' do
      @bouquet = Bouquet.find_by_slug(params[:slug])
      erb :'/bouquets/show'
    end

    patch '/bouquets/edit' do
    end

    delete '/bouquets/:id' do
      @bouquet = Bouquet.find(params[:id])
      if logged_in? && current_customer.bouquets.include?(@bouquet)
        @bouquet.delete
        redirect "/bouquets/new"
      else
        redirect "/login"
      end
    end  



end

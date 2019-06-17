class BouquetsController < ApplicationController


  get '/bouquets' do
     @bouquet = Bouquet.all
       # if logged_in? && current_customer.bouquets.include?(@bouquet)
        # binding.pry
       erb :'/bouquets/index'
       # else
        # redirect "/bouquets"
      # end
  end

  get '/bouquets/new' do
    erb :'/bouquets/create_new'
  end

  post '/bouquets' do
    @bouquet = Bouquet.create(name: params[:name], occassion: params[:occassion], accessories: params[:accessories], flower_name: params[:flower_name], flower_quantity: params[:flower_quantity], customer_id: current_customer.id)
       # binding.pry
     if !params[:flower_quantity].scan(/\d/).empty?
       @bouquet.save
       # binding.pry
      redirect "/bouquets/#{@bouquet.id}"
     else
      redirect "/bouquets/new"

     end
  end

  get '/bouquets/:id' do
    @bouquet = Bouquet.find(params[:id])
    if current_customer.bouquets.include?(@bouquet)
      # binding.pry
      erb :'/bouquets/show'
    else
      redirect "/logout"
    end
  end

  patch '/bouquets/edit/:id' do

  end

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

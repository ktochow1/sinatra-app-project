class BouquetsController < ApplicationController


  get '/bouquets' do
     @bouquet = current_customer.bouquets
       erb :'/bouquets/index'
  end

  get '/bouquets/new' do
    erb :'/bouquets/create_new'
  end

  post '/bouquets' do
    @bouquet = Bouquet.create(name: params[:name], occassion: params[:occassion], accessories: params[:accessories], flower_name: params[:flower_name], flower_quantity: params[:flower_quantity], customer_id: current_customer.id)
     if !params[:flower_quantity].scan(/\d/).empty?
       @bouquet.save
       redirect "/bouquets/#{@bouquet.id}"
     else
       redirect "/bouquets/new"
     end
  end

  get '/bouquets/:id' do
    @bouquet = Bouquet.find(params[:id])
    if current_customer.bouquets.include?(@bouquet)
      erb :'/bouquets/show'
    else
      redirect "/logout"
    end
  end

  get '/bouquets/:id/edit' do
    @bouquet = Bouquet.find(params[:id])
    if logged_in? && current_customer.bouquets.include?(@bouquet)
      erb :'/bouquets/edit'
    else
      redirect "/login"
    end
  end

  patch '/bouquets/:id' do
    
    @bouquet = Bouquet.find(params[:id])
    if logged_in? && current_customer.bouquets.include?(@bouquet)
      @bouquet.update(params[:bouquet])
      # binding.pry
      # if !params[:flower_quantity].scan(/\d/).empty?
      #   redirect "/bouquets/#{@bouquet.id}"
      #
      # end
      erb :'/bouquets/show'
    else
    redirect "/login"
    end
  end

    delete '/bouquets/:id' do
      @bouquet = Bouquet.find(params[:id])
      if logged_in? && current_customer.bouquets.include?(@bouquet)
        @bouquet.delete
        redirect "/bouquets"
      else
        redirect "/login"
      end
    end

end

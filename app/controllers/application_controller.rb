require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/signup' do
    if logged_in?
      redirect "/bouquets/new"
    else
      erb :signup
    end
  end

  post '/signup' do

    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect "/signup"
    else
      @customer = Customer.create(username: params[:username], email: params[:email], password: params[:password])
      @customer.save
      session[:user_id] = @customer.id
      # binding.pry
      redirect "/bouquets"
    end
  end

  get '/login' do
    if logged_in?
      erb :'/bouquets/create_new'
    else
      erb :login
    end
  end

  post '/login' do
    @customer = Customer.find_by(:username => params[:username])
      # binding.pry
    if @customer && @customer.authenticate(params[:password])
      session[:user_id] = @customer.id
      redirect "/bouquets"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/bouquets"
    end

    end

  helpers do
    def current_customer
      Customer.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_customer
    end
  end

end

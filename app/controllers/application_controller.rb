require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secrets, "secret"
  end

  get '/signup' do
    # if logged_in?
    #   redirect "/flowers"
    # else
      erb :signup
    # end
  end

  post '/signup' do

    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect "/signup"
    else
      @customer = Customer.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @customer.id
      redirect "/flowers"
    end
  end

  get '/login' do
    if logged_in?
      redirect "/flowers"
    else
      erb :login
    end
  end

  post '/login' do
    @customer = Customer.find_by(:username => params[:username])
    if @customer && @customer.authenticate(params[:password])
      session[:user_id] = @customer.id
      # redirect "/flowers"
    else
      redirect "/login"
    end
  end

  # get '/signout' do
  #   if logged_in?
  #     erb :signout
  #   else
  #     redirect "/login"
  #   end
  # end

  get '/signout' do
    # if logged_in?
      session.clear
      redirect "/login"
    # else
      # redirect "/flowers"
    # end

    end

  helpers do

    def current_customer
      Customer.find_by(session[:user_id])
    end

    def logged_in?
      !!current_customer
    end


  end

end

require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secrets, "secret"
  end

  get '/signup' do
    if logged_in?
      redirect "/flowers"
    else
    erb :signup
    end
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
    @customer = Customer.find_by(:userame => params[:username])
    if @customer && customer.authenticate(params[:password])
      session[:user_id] = @customer.id
      redirect "/flowers"
    else
      redirect "/login"
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end

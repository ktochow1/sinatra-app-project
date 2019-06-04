require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :view, 'app/views'
    enable :sessions
    set :session_secrets, "secret"
  end

  get '/' do
    erb :'/views/signup'
  end

  # signup, login


end

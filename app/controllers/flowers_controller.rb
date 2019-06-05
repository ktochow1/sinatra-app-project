class FlowersController < ApplicationController

  get '/flowers' do
     if logged_in?
       erb :'/flowers/index'
    else
      redirect "/login"
    end
  end


end

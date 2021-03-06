class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/tweets'
    else
      erb :'users/new'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == "" 
      redirect'/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/tweets'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
end
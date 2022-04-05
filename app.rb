require 'sinatra/base'
require 'sinatra/reloader'
require './lib/login'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to MakersBnB'
    erb :index
  end

  post '/login' do
    @new_user = Login.new(params[:email], params[:password])
    redirect '/book-space' if @new_user.check
    redirect '/'
  end

  get '/book-space' do
    erb :book_space
  end

  get '/sign-in' do
    'Sign in'
  end

  get '/list-space' do
    erb :list_space
  end

  post '/list-space' do
    
    redirect '/book-space'
  end

  get '/beach-villa' do
    'Beach villa'
  end

  get '/city-apartment' do
    'City apartment'
  end

  run! if app_file == $0
end
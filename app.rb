require 'sinatra/base'
require 'sinatra/reloader'
require './lib/account'
require './lib/listing'
require './lib/availability'
require './lib/default'
require 'pg'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/login' do
    session[:new_user] = Account.create(first_name: params[:first_name], 
    last_name: params[:last_name], 
    email: params[:email], 
    password: params[:password])
    @new_user = session[:new_user] 
    redirect '/book_space'
  end

  get '/book_space' do
    @properties = @@listed_spaces
    erb :book_space
  end

  get '/register/list-space' do
    erb :register
  end

  get '/sign-in' do
    'Sign in'
  end

  get '/sign-up' do
    'Sign up'
  end

  post '/list-space' do

    erb(:list_space)
  end

  get '/beach-villa' do
    @beach_account = Default.account
    @beach_listing = Default.beach_villa_listing
    @beach_availability = Default.beach_villa_availability
    erb(:beach_villa)
  end

  get '/register/beach-villa' do
    erb :register_beach
  end

  post '/book-beach' do

  end

  get '/city-apartment' do
    'City apartment'
  end

  get '/my_space' do
    @properties = @@listed_spaces
    erb(:my_space)
  end

  @@listed_spaces = []

  post '/listed-space' do
   @@listed_spaces << params
   redirect('/book_space')
  end

  run! if app_file == $0
end

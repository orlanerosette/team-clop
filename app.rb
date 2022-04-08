
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
  @@listed_spaces = []

  get "/" do
    redirect '/book_space'
  end

  get "/book_space" do
    @properties = @@listed_spaces
    erb :book_space
  end

  get '/register/list-space' do
    erb :register
  end

  get "/sign-in" do
    "Sign in"
  end

  get "/sign-up" do
    erb(:signupmain)
  end

  post '/list-space' do
    @new_user = Account.create(first_name: params[:first_name], 
    last_name: params[:last_name], 
    email: params[:email], 
    password: params[:password])
    session[:user_id] = @new_user.account_id
    erb(:list_space)
  end

  post '/listed-space' do
    @@listed_spaces << params
    @new_listing = Listing.create(owner_id: session[:user_id], 
    name: params[:property_name], 
    description: params[:description], 
    price: params[:price])
    redirect("/book_space")
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

  get "/beach-villa" do
    erb(:beach_villa)
  end

  get "/city-apartment" do
    @city_account = Default.account
    @city_listing = Default.city_apartment_listing
    @city_availability = Default.city_apartment_availability
    erb(:city_apartment)
  end

  get '/register/city-apartment' do
    erb :register_city
  end

  post '/book-city_apartment' do

  end

  get "/my_space" do
    @properties = @@listed_spaces
    erb(:my_space)
  end

  run! if app_file == $0
end

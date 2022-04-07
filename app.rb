require 'sinatra/base'
require 'sinatra/reloader'
require './lib/account'
require './lib/listing'
require './lib/availability'
require 'pg'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end



  get '/' do
    erb :index
  end

  post '/login' do
    @new_user = Account.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    redirect '/book_space'
  end

  get '/book_space' do
    @properties = @@listed_spaces
    p @properties
    erb :book_space
  end

  get '/register' do
    erb :register
  end

  get '/sign-in' do
    'Sign in'
  end

  get '/sign-up' do
    'Sign up'
  end

  post '/list-space' do
    #database
    erb(:list_space)
  end

  get '/beach-villa' do
    erb(:beach_villa)
  end

  get '/city-apartment' do
    'City apartment'
  end

  get '/my_space' do
    @properties = @@listed_spaces
    p @properties
    erb(:my_space)
  end


  @@listed_spaces = []

  post '/listed-space' do
   @@listed_spaces << params
   p @@listed_spaces
   p params
   redirect('/book_space')
  end

  run! if app_file == $0
end

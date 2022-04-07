require 'sinatra/base'
require 'sinatra/reloader'
require './lib/account'
require './lib/listing'
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
    redirect '/book-space'
  end

  get '/book-space' do
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

  get '/list-space' do
    erb :list_space
  end

  post '/list-space' do
    #database
    redirect '/book-space'
  end

  get '/beach-villa' do
    erb(:beach_villa)
  end

  get '/city-apartment' do
    'City apartment'
  end

  run! if app_file == $0
end

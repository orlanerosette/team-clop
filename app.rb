require 'sinatra/base'
require 'sinatra/reloader'
require './lib/login'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @new_user = Login.new(params[:email], params[:password])
    redirect '/book_space' if @new_user.check
    redirect '/'
  end

  get '/book_space' do
    @properties = @@listed_spaces
    p @properties
    erb :book_space
  end

  get '/sign-in' do
    'Sign in'
  end

  get '/list-space' do
    erb :list_space
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

require 'sinatra'
require 'sinatra/base'
require './lib/link.rb'
require 'envyable'
Envyable.load('config/env.yml')

class Bookmarks < Sinatra::Base
  enable :sessions
  set :session_secret, 'My Secret Session'

  get '/' do
    @links = Link.all
    erb(:index)
  end

  get '/add-new-bookmark' do
    erb(:add_new_link)
  end

  post '/store_links' do
    session[:new_url] = params[:new_url]
    redirect '/'
  end

  run! if app_file == $0
end

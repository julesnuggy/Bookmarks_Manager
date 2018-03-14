require 'sinatra'
require 'sinatra/base'
require './lib/link.rb'
require './lib/db_connection_setup.rb'
require 'envyable'
Envyable.load('config/env.yml')

class Bookmarks < Sinatra::Base
  enable :sessions
  set :session_secret, 'My Secret Session'

  get '/' do
    @links = Link.all
    erb(:index)
  end

  post '/add-new-bookmark' do
    Link.add_bookmark(params[:new_url])
    redirect '/'
  end

  run! if app_file == $0
end

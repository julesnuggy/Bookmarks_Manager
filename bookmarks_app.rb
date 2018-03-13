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

  post '/add-new-bookmark' do
    @new_link = Link.new(params[:new_url])
    @new_link.add_bookmark
    redirect '/'
  end

  run! if app_file == $0
end

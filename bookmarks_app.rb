require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/link.rb'
require './lib/db_connection_setup.rb'
require 'envyable'
require 'uri'
Envyable.load('config/env.yml')

class Bookmarks < Sinatra::Base
  enable :sessions
  set :session_secret, 'My Secret Session'
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb(:index)
  end

  post '/add-new-bookmark' do

    begin
      url_title = params[:url_title]
      url_address = URI.parse(params[:url_address])
      url_tags = params[:url_tags]
      url_comments = params[:url_comments]
    rescue
      flash[:invalid_bookmark] = "Invalid url link T_T"
      redirect '/'
    end

    if url_address.kind_of?(URI::HTTP)
      Link.add_bookmark(url_title, url_address, url_tags, url_comments)
      flash[:valid_bookmark] = "Bookmark added ^_^"

    else
      flash[:check_bookmark] = "Please check that your link is correct and includes the scheme (\'http\' or \'https\')"

    end

    redirect '/'
  end

  post '/update-link' do
    @update_id = params[:update_id]
    erb(:update_link)
  end

  post '/do-updates' do
    #STUFF
    redirect '/'
  end

  run! if app_file == $0
end

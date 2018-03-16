require './bookmarks_app.rb'

use Rack::MethodOverride # For use of Rack's HTTP verbs

run Bookmarks

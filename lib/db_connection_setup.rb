require './lib/db_connection.rb'

@dbname = (ENV['RACK_ENV'] == "testing") ? 'bookmark_manager_test' : 'bookmark_manager'
Db_Connection.setup(@dbname, 'julesnuggy')

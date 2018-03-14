require_relative './db_connection.rb'
require 'pg'

class Link

  def self.add_bookmark(url)
    Db_Connection.query("INSERT INTO links (url) VALUES ('#{url}');")
  end

  def self.all
    @records = Db_Connection.query("SELECT * FROM links;")
    @all_bookmarks = @records.map { |link| [link['id'], link['url'], link['tags'], link['comments']] }
  end

end

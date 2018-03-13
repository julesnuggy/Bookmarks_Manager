require 'pg'

class Link
  attr_reader :records, :id, :url

  def initialize(url, id = nil)
    @id = id
    @url = url
    @all_bookmarks = []
  end

  def add_bookmark
    @dbname = (ENV['RACK_ENV'] == "testing") ? 'bookmark_manager_test' : 'bookmark_manager'
    p "database #{@dbname}"
    @con = PG.connect(dbname: @dbname, user: 'julesnuggy')
    p @con.exec("INSERT INTO links (url) VALUES ('#{url}');")
  end

  def self.all
    @dbname = (ENV['RACK_ENV'] == "testing") ? 'bookmark_manager_test' : 'bookmark_manager'
    @con = PG.connect(dbname: @dbname, user: 'julesnuggy')
    @records = @con.exec("SELECT * FROM links;")
    @all_bookmarks = @records.map { |link| [link['id'], link['url'], link['tags'], link['comments']] }
  end

private



end

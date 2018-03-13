require 'pg'

class Link
  attr_reader :records, :id, :url

  def initialize(id, url)
    @id = id
    @url = url
    @all_bookmarks = []
  end

  def self.all
    if ENV['RACK_ENV'] == "testing"
      @con = PG.connect(dbname: 'bookmark_manager_test', user: 'julesnuggy')

    elsif ENV['RACK_ENV'] == "production"
      @con = PG.connect(dbname: 'bookmark_manager', user: 'julesnuggy')

    end

    @records = @con.exec "SELECT * FROM links"
    @all_bookmarks = @records.map { |link| [link['id'], link['url'], link['tags'], link['comments']] }
  end

end

require_relative './db_connection.rb'
require 'pg'
require 'uri'

class Link

  attr_reader :id, :title, :url, :tags, :comments

  def initialize(id, title, url, tags, comments)
    @id = id
    @title = title
    @url = url
    @tags = tags
    @comments = comments
  end

  def self.all
    @all_bookmarks = []
    @records = Db_Connection.query("SELECT * FROM links ORDER BY id ASC;")
    @records.map { |link| @all_bookmarks << Link.new(link['id'], link['title'], link['url'], link['tags'], link['comments']) }
    @all_bookmarks
  end

  def self.add_bookmark(title, url, tags, comments)
    Db_Connection.query("INSERT INTO links (title, url, tags, comments) VALUES ('#{title}', '#{url}', '#{tags}', '#{comments}');")
  end

  def self.update(id, title, url, tags, comments)
    Db_Connection.query("UPDATE links SET title = '#{title}', url = '#{url}', tags = '#{tags}', comments = '#{comments}' WHERE id = #{id};")
  end

  def self.delete(id)
    Db_Connection.query("DELETE FROM links WHERE id = #{id};")
  end

  def self.search(query)
    @search_result = []
    @search_query = Db_Connection.query("SELECT * FROM links WHERE title = '#{query}';")
    @search_query.map { |link| @search_result << Link.new(link['id'], link['title'], link['url'], link['tags'], link['comments']) }
    @search_result
  end

  def self.comment(comm_text, link_id)
    Db_Connection.query("INSERT INTO comments (text, link_id) VALUES ('#{comm_text}', #{link_id});")
  end
end

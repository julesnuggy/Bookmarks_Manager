require_relative './lib/db_connection.rb'
require 'pg'

desc 'sets up the test database with 3 links'
  task :test_database_setup do
    p "Setting up the test database table..."
    Db_Connection.setup('bookmark_manager_test', 'julesnuggy')
    Db_Connection.query("DELETE FROM links")
    Db_Connection.query("ALTER SEQUENCE links_id_seq RESTART WITH 1")
    Db_Connection.query("INSERT INTO links (title, url, tags, comments) VALUES ('Google', 'https://www.google.com', 'search', 'knows everything');")
    Db_Connection.query("INSERT INTO links (title, url) VALUES ('Facebook', 'https://www.facebook.com');")
    Db_Connection.query("INSERT INTO links (title, url) VALUES ('Makers Academy', 'https://www.makersacademy.com');")
  end

desc 'sets up development and test databases and tables from scratch'
  task :setup do
    p "Creating databases..."
    ['bookmark_manager', 'bookmark_manager_test'].each { |dbname|
      PG.connect.exec("CREATE DATABASE #{dbname};")
      Db_Connection.setup(dbname, 'julesnuggy')
      Db_Connection.query("CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60));")
    }
  end

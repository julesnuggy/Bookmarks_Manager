require 'pg'

def setup_test
  p "test_db_setup.rb is setting up the test database..."
  Db_Connection.setup('bookmark_manager_test', 'julesnuggy')
  #@connection = PG.connect(dbname: 'bookmark_manager_test', user: 'julesnuggy')
  Db_Connection.query("DELETE FROM links")
  Db_Connection.query("ALTER SEQUENCE links_id_seq RESTART WITH 1")
  Db_Connection.query("INSERT INTO links (url) VALUES ('www.google.com');")
  Db_Connection.query("INSERT INTO links (url) VALUES ('www.facebook.com');")
  Db_Connection.query("INSERT INTO links (url) VALUES ('www.makersacademy.com');")

  #@connection.exec("DELETE FROM links")
  #@connection.exec("ALTER SEQUENCE links_id_seq RESTART WITH 1")
  #@connection.exec("INSERT INTO links (url) VALUES ('www.google.com');")
  #@connection.exec("INSERT INTO links (url) VALUES ('www.facebook.com');")
  #@connection.exec("INSERT INTO links (url) VALUES ('www.makersacademy.com');")
end

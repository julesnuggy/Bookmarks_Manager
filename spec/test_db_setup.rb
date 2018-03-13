require 'pg'

def setup_test
  p "test_db_setup.rb is setting up the test database..."
  @con = PG.connect(dbname: 'bookmark_manager_test', user: 'julesnuggy')
  @con.exec("DELETE FROM links")
  @con.exec("ALTER SEQUENCE links_id_seq RESTART WITH 1")
  @con.exec("INSERT INTO links (url) VALUES ('www.google.com');")
  @con.exec("INSERT INTO links (url) VALUES ('www.facebook.com');")
  @con.exec("INSERT INTO links (url) VALUES ('www.makersacademy.com');")
end

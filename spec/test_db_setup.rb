require 'pg'

def setup_test
  p "test_db_setup.rb is setting up the test database..."
  @con = PG.connect(dbname: 'bookmark_manager_test', user: 'julesnuggy')
  @con.exec("DELETE FROM links")
  @con.exec("INSERT INTO links VALUES (1, 'www.google.com');")
  @con.exec("INSERT INTO links VALUES (2, 'www.facebook.com');")
  @con.exec("INSERT INTO links VALUES (3, 'www.makersacademy.com');")
end

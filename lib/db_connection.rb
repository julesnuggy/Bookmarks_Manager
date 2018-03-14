require 'pg'

class Db_Connection
  attr_accessor :connection

  def self.setup(db_name, user)
    @connection = PG.connect(dbname: db_name, user: 'julesnuggy')
  end

  def self.connection
    @connection
  end

  def self.query(query_string)
    @connection.exec(query_string)
  end
end

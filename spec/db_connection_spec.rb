require 'pg'
require 'db_connection'

describe Db_Connection do
  describe '.setup' do
    it 'should set up a connection to the required database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test', user: 'julesnuggy')
      Db_Connection.setup('bookmark_manager_test', 'julesnuggy')
    end

    it 'should have a persistent connection' do
      connection = Db_Connection.setup('bookmark_manager_test', 'julesnuggy')
      expect(Db_Connection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'should submit a query to the database' do
      connection = Db_Connection.setup('bookmark_manager_test', 'julesnuggy')
      query_string = "INSERT INTO links (url) VALUES ('www.github.com');"
      expect(connection).to receive(:exec).with(query_string)
      Db_Connection.query(query_string)
    end
  end
end

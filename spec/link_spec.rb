require 'link'

describe Link do
  subject(:link) { described_class }

  describe '#all' do
    it 'returns all links' do
      links = link.all
      expect(links.inspect).to include("www.google.com")
      expect(links.inspect).to include("www.facebook.com")
      expect(links.inspect).to include("www.makersacademy.com")
    end
  end

  describe '#add_bookmark' do
    it 'adds a bookmark to the database' do
      new_link = link.
    end
  end

end

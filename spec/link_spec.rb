require 'link'

describe Link do

  describe '#all' do
    it 'returns all links' do
      expect(Link.all.inspect).to include("www.google.com")
      expect(Link.all.inspect).to include("www.facebook.com")
      expect(Link.all.inspect).to include("www.makersacademy.com")
    end
  end

  describe '#add_bookmark' do
    it 'adds a bookmark to the list' do
      Link.add_bookmark("www.instagram.com")
      expect(Link.all.inspect).to include('www.instagram.com')
    end
  end

end

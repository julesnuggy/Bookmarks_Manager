require 'link'

describe Link do
  subject(:new_link) { described_class.new("www.instagram.com") }

  describe '#all' do
    it 'returns all links' do
      expect(Link.all.inspect).to include("www.google.com")
      expect(Link.all.inspect).to include("www.facebook.com")
      expect(Link.all.inspect).to include("www.makersacademy.com")
    end
  end

  describe '#add_bookmark' do
    it 'adds a bookmark to the list' do
      new_link.add_bookmark
      expect(Link.all.inspect).to include('www.instragram.com')
    end
  end

end

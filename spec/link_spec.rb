require 'link'

describe Link do

  describe 'creates an array of Link instances' do
    it 'has attributes for link id, title, url, tags and comments' do
    expect(Link.all[0]).to have_attributes(id: "1", title: "Google", url: 'https://www.google.com', tags: 'search', comments: 'knows everything')
    end
  end

  describe '#all' do
    it 'returns all links' do
      expect(Link.all.inspect).to include("https://www.google.com")
      expect(Link.all.inspect).to include("https://www.facebook.com")
      expect(Link.all.inspect).to include("https://www.makersacademy.com")
    end
  end

  describe '#add_bookmark' do
    it 'adds a bookmark to the list' do
      Link.add_bookmark("Instagram", "https://www.instagram.com", nil, nil)
      expect(Link.all.inspect).to include('https://www.instagram.com')
    end
  end

end

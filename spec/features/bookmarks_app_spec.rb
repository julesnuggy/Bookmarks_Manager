require_relative '../../bookmarks_app.rb'
#require 'web_helpers.rb'

describe Bookmarks do
  feature 'Manages my bookmarks:' do
    scenario 'shows a list of links' do
      visit('/')
      click_on 'Show Links'
      expect(page).to have_content 'www.google.com'
      expect(page).to have_content 'www.facebook.com'
      expect(page).to have_content 'www.makersacademy.com'
    end

    scenario 'user can add new links to the manager' do
      visit ('/')
      fill_in 'new_url', with: 'www.twitter.com'
      click_on 'Add New Bookmark'
      click_on 'Show Links'
      expect(page).to have_content 'www.twitter.com'
    end
  end
end

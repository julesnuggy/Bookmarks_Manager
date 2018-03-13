require_relative '../../bookmarks_app.rb'
require 'web_helpers'

describe Bookmarks do
  feature 'Manages my bookmarks:' do
    scenario 'shows a list of links' do
      visit('/')
      click_on 'Show Links'
      expect(page).to have_content 'www.google.com'
      expect(page).to have_content 'www.facebook.com'
      expect(page).to have_content 'www.makersacademy.com'
    end

    context 'user can add new links to the manager' do
      before do
        visit ('/')
        click_on 'Add New Bookmark'
      end

      scenario 'and is shown a form to fill in' do
        expect(page).to have_content 'Enter new bookmark details'
      end

      scenario 'and the new link is added to the list' do
        fill_in 'url' with: 'www.twitter.com'
        click_on 'Complete'
        expect(page).to have_content 'www.twitter.com'
      end
    end

  end
end

require_relative '../../bookmarks_app.rb'
#require 'web_helpers.rb'

describe Bookmarks do
  before do
    visit ('/')
  end

  feature 'CRUD:' do
    scenario 'shows the list of links' do
      expect(page).to have_link('Google', href: 'https://www.google.com')
      expect(page).to have_link('Facebook', href: 'https://www.facebook.com')
      expect(page).to have_link('Makers Academy', href: 'https://www.makersacademy.com')
    end

    scenario 'CREATES a new link' do
      fill_in 'url_title', with: 'Twitter'
      fill_in 'url_address', with: 'https://www.twitter.com'
      click_on 'Add New Bookmark'
      expect(page).to have_link('Twitter', href: 'https://www.twitter.com')
    end

    scenario 'READS (finds) a link' do
      fill_in 'search_bar', with: 'Google'
      click_on 'Find'
      expect(page).to have_link('Google', href: 'https://www.google.com')
      expect(page).not_to have_link('Twitter', href: 'https://www.twitter.com')
      expect(page).not_to have_link('Makers Academy', href: 'https://www.makersacademy.com')
    end

    scenario 'UPDATES a link' do
      fill_in 'url_title', with: 'postgresqltutorial'
      fill_in 'url_address', with: 'https://www.postgresqltutorial.com'
      click_on 'Add New Bookmark'

      find_by_id('update_5').click
      fill_in 'updated_title', with: 'PSQL Tutorial'
      fill_in 'updated_address', with: 'https://www.postgresqltutorial.com'
      fill_in 'updated_tags', with: 'PSQL tag'
      click_on 'Update Bookmark'
    end

    scenario 'DELETES a link' do
      find_by_id('delete_5').click
      expect(page).not_to have_content ('PSQL Tutorial')
    end

  end

  feature 'validation' do
    scenario 'raises a confirmation message in flash for correct and valid links' do
      fill_in 'url_title', with: 'Linux'
      fill_in 'url_address', with: 'https://www.linux.com'
      click_on 'Add New Bookmark'
      expect(page).to have_content 'Bookmark added'
    end

    scenario 'raises an error message in flash for incorrect links' do
      fill_in 'url_address', with: 'www.twitter.com'
      click_on 'Add New Bookmark'
      expect(page).to have_content 'Please check that your link is correct and includes the scheme (\'http\' or \'https\')'
    end

    scenario 'raises an error message in flash for invalid links' do
      fill_in 'url_address', with: 'http://www twitter.com'
      click_on 'Add New Bookmark'
      expect(page).to have_content 'Add failed: invalid url link'
    end
  end

  feature 'opens a webpage in a new window' do
    scenario 'when the URL is clicked on' do
      #expect(window_opened_by { click_on 'https://www.google.com' }).to have_content
      within_window window_opened_by { click_on 'Makers Academy' }
      save_and_open_page
      expect(page).to have_content 'LEARN TO CODE IN 12 WEEKS'
    end
  end

end

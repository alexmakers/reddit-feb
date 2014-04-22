require 'spec_helper'

describe 'voting for posts' do
  let!(:alex) { create(:alex) }
  before { create(:post, user: alex) }

  describe 'upvoting' do
    before do
      clear_emails
      login_as create(:mario)
    end

    it 'adds to the points of the post', js: true do
      visit '/posts'
      click_button '↑'

      expect(page).to have_css '.votes_count', text: '1'
    end

    it 'sends an email notifying the user of the vote' do
      visit '/posts'
      click_button '↑'

      open_email('alex@example.com')
      expect(current_email).to have_content 'Your post got upvoted'
    end
  end

  describe 'downvoting' do
    it 'reduces to the points of the post', js: true do
      visit '/posts'
      click_button 'Downvote'

      expect(page).to have_css '.votes_count', text: '-1'
    end
  end

  it 'sends an email notifying the user of the vote' do
    visit '/posts'
    click_button 'Downvote'

    open_email('alex@example.com')
    expect(current_email).to have_content 'Your post got downvoted'
  end
end
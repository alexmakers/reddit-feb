require 'spec_helper'

describe 'creating posts' do
  before do
    visit '/posts'
    click_link 'New post'
  end
  
  context 'with valid data' do
    it 'adds the post to the posts page' do
      fill_in 'Title', with: 'My post'
      fill_in 'Description', with: 'Lorem ipsum'
      fill_in 'URL', with: 'http://google.com'
      click_button 'Create Post'

      expect(current_path).to eq posts_path
      expect(page).to have_content 'My post'
    end
  end

  context 'with invalid data' do
    it 'shows validation errors' do
      click_button 'Create Post'

      expect(page).to have_content 'error'
    end
  end
end
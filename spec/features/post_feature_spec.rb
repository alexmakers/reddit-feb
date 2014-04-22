require 'spec_helper'

describe 'posts index page' do
  context 'no posts' do
    it 'displays a message' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end

  context 'with posts' do
    before { create(:post) }
    
    it 'displays the posts' do
      visit '/posts'
      expect(page).to have_content 'My cool post'
    end
  end
end
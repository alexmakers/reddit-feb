require 'spec_helper'

describe Post do
  describe 'validations' do
    it 'validates presence of title' do
      post = build(:post, title: nil)
      expect(post).to have(1).errors_on(:title)
    end

    it 'validates presence of URL' do
      post = build(:post, url: nil)
      expect(post).to have(2).errors_on(:url)
    end

    it 'validates format of URL' do
      post = build(:post, url: 'nonsense')
      expect(post).to have(1).errors_on(:url)
    end
  end
end

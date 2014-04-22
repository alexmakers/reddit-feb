class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, format: { with: /\Ahttp/ }
end

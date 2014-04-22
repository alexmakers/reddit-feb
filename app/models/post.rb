class Post < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true, format: { with: /\Ahttp/ }

  def votes_count
    votes.up.recent.count - votes.down.recent.count
  end
end
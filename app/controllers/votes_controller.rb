class VotesController < ApplicationController
  # before_action :authenticate_user!

  def create
    @post = Post.find params[:post_id]

    @vote = @post.votes.new direction: params[:direction]
    # @vote.user = current_user
    
    if @vote.save
      WebsocketRails[:votes].trigger 'new', { id: @post.id, new_votes_count: @post.votes_count }
      render json: { votes_count: @post.votes_count }
    end
  end
end
class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  private

  def post_params
    params[:post].permit(:title, :description, :url)
  end
end
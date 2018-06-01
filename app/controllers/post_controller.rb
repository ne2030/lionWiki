class PostController < ApplicationController
  def new
  end

  def create
  end

  def search
  end

  def detail
    postId = params[:id]
    @post = Post.where(id: postId)[0]
    @contents = Content.where(post_id: postId)
    @comments = Comment.where(post_id: postId)
  end
end

class PostController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def search
  end

  def detail
    @posts = Post.find_by(title: "bkh")
    @contents = Content.all
    @comments = Comment.all
  end
end

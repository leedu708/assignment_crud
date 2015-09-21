class PostsController < ApplicationController

  def index

    @posts = Post.all

  end

  def create

    @post = Post.new(whitelisted_post_params)
    @post.save
    redirect_to post_path(@post)

  end

  def new

    @post = Post.new

  end

  def edit

    @post = Post.find(params[:id])

  end

  def show

    @post = Post.find(params[:id])

  end

  def update

    @post = Post.find(params[:id])
    @post.update(whitelisted_post_params)

    flash.notice = "Post '#{@post.title}' Updated!"
    redirect_to post_path(@post)

  end

  def destroy

    @post = Post.find(params[:id])
    @post.destroy

    flash.notice = "Post '#{@post.title}' has been deleted!"

    redirect_to posts_path

  end

  def whitelisted_post_params

    params.require(:post).permit(:title, :body)

  end

end

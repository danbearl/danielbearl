class PostsController < ApplicationController
  expose(:posts)
  expose(:post, attributes: :post_params)

  def create
    if post.save
      redirect_to posts_path, notice: "Post successfully created."
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

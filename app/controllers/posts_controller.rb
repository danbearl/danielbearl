class PostsController < ApplicationController

  before_filter :require_user, only: [:new, :update, :create, :destroy, :staging]

  expose(:post, attributes: :post_params)
  expose(:posts)
  expose(:published_posts) {
    if params[:tags]
      Post.where("tags && ARRAY[?] AND draft = false", params[:tags]).paginate(page: params[:page], per_page: 10)
    else
      Post.where("draft = false").paginate(page: params[:page], per_page: 10)
    end
  }

  expose(:drafts) { Post.where("draft = true").paginate(page: params[:page], per_page:10) }

  def create
    if post.save
      redirect_to posts_path, notice: "Post successfully created."
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path, notice: "Post successfully updated."
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path, notice: "Post successfully deleted."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tags_list, :draft)
  end
end

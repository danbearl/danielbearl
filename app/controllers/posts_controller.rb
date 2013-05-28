class PostsController < ApplicationController
  expose(:posts) {
    if params[:tags]
      Post.where("tags && ARRAY[?]", params[:tags]).paginate(page: params[:page], per_page: 10)
    else
      Post.paginate(page: params[:page], per_page: 10)
    end
  }
  expose(:post, attributes: :post_params)

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
    params.require(:post).permit(:title, :body, :tags_list)
  end
end

class PagesController < ApplicationController

  before_filter :require_user, only: [:new, :update, :create, :destroy]

  expose(:pages)
  expose(:page, finder: :find_by_slug, finder_parameter: :slug, attributes: :page_params)
  expose(:page_slugs) { Page.select(:slug).map(&:slug) }
  expose(:posts)
  expose(:newest_post) { Post.where("draft = false").first }

  def show
    if page.is_a? NilClass
      redirect_to "/404.html"
    end
  end

  def create
    if page.save
      redirect_to slug_path(page.slug), notice: "Page successfully created."
    else
      render :new
    end
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to slug_path(@page.slug), notice: "Page successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    if @page.destroy
      redirect_to :root, notice: "Page successfully deleted."
    else
      flash.now "Page not destroyed!"
    end
  end

  private

  def page_params
    params.require(:page).permit(:name, :body)
  end
end

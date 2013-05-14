class PagesController < ApplicationController

  expose(:pages)
  expose(:page, finder: :find_by_slug, finder_parameter: :slug)
  expose(:created_page) { Page.new(page_params) }
  expose(:page_slugs) { Page.select(:slug).map(&:slug) }

  def show
    if page.is_a? NilClass
      redirect_to "/404.html"
    end
  end

  def create
    if created_page.save
      redirect_to slug_path(created_page.slug), notice: "Page successfully created."
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
    page.destroy
    redirect_to :root, notice: "Page successfully deleted."
  end

  private

  def page_params
    params.require(:page).permit(:name, :body)
  end
end

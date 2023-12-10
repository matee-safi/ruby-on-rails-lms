class Blogs::TitleImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog

  def destroy
    @blog.title_image.purge
    redirect_to edit_blog_path(@blog)
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end

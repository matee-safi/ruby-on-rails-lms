class PagesController < ApplicationController
  def index
  end

  def home
    @latest_courses = Course.last(5).reverse
    @latest_blogs = Blog.last(5).reverse
  end

  def dashboard
    @user = current_user
  end
end

class PagesController < ApplicationController
  def index
  end

  def home
    @latest_courses = Course.last(5)
    @courses = Course.all
    @blogs = Blog.all
  end

  def dashboard
  end
end

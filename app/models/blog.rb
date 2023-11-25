class Blog < ApplicationRecord
  def latest_blogs
    Blog.order("created_at desc").limit(5)
  end
end

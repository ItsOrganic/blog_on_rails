class BlogPostsController < ApplicationController
    def index
    @blog_posts = BlogPosts.all()
    end
end
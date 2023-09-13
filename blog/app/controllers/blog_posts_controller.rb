class BlogPostsController < ApplicationController
    def index
    @blog_posts = BlogPosts.all()
    end
    def show
        @blog_post = BlogPosts.find(params[:id])
    end
end
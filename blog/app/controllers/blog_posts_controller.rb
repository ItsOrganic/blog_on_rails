class BlogPostsController < ApplicationController
    def index
    @blog_posts = BlogPosts.all()
    end
    def show
        @blog_post = BlogPosts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
    def new
        @blog_post = BlogPosts.new
    end
    def create
    end
    
end
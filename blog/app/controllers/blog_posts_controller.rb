# app/controllers/blog_posts_controller.rb

class BlogPostsController < ApplicationController
before_action :set_blog_find,only:[:show, :edit, :update, :destroy]

    def index
        @blog_posts = BlogPosts.all()
    end
    def show
            # @blog_post = BlogPosts.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end
    def new
      # Create a new instance of BlogPosts
      @blog_post = BlogPosts.new
    end
    def edit
        # @blog_post = BlogPosts.find(params[:id])
    end
  
    def create
      # Create a new instance of BlogPosts with parameters from the form
      @blog_post = BlogPosts.new(blog_post_params)
  
      # Attempt to save the record to the database
      if @blog_post.save
        redirect_to @blog_post

        # Redirect to a success page or do something else
      else
        # If there are validation errors, re-render the form
        render :new, status: :unprocessable_entity
      end
    end
    def update
    # @blog_post = BlogPosts.find(params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
    end
    def destroy
    
    @blog_post.destroy
    redirect_to root_path
    end

    def set_blog_find
      @blog_post = BlogPosts.find(params[:id])
    end
  
    private
  
    def blog_post_params
      # Define the parameters allowed for creating a new blog post
      params.require(:blog_posts).permit(:title, :body)
    end

  end
  
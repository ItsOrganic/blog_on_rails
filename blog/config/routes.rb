Rails.application.routes.draw do
  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  patch "/blog_posts/:id", to: "blog_posts#update", as: :update_blog_post
  delete "/blog_posts/:id", to: "blog_posts#destroy"
  post "/blog_posts/new", to: "blog_posts#create", as: :blog_posts
  get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post


  root "blog_posts#index"
end
